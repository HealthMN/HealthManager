import Foundation
import Charts
import Then
import RealmSwift
import SnapKit
import UIKit

final class ProfileGraphVC: BaseVC<ProfileViewModel> {
    
    private let cells = ["운동시간 수정", "설정", "회원 탈퇴"]
    
    private let contentScrollView = UIScrollView()
    private let contentView = UIView()
    
    private let lineChartView = LineChartView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.xAxis.labelTextColor = .clear
        $0.rightAxis.enabled = false
        $0.leftAxis.labelTextColor = HealthManagerAsset.hmPrimary.color
        $0.xAxis.setLabelCount(7, force: false)
        $0.animate(xAxisDuration: 0.5)
        $0.xAxis.drawGridLinesEnabled = false
        $0.leftAxis.drawGridLinesEnabled = false
        $0.doubleTapToZoomEnabled = false
        $0.xAxis.labelPosition = .bottom
    }
    
    private let profileTableView = UITableView().then {
        $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
        $0.separatorStyle = .none
        $0.rowHeight = 60
        $0.layer.cornerRadius = 8
    }
    
    private let introduceProjectLabel = UILabel().then {
        $0.text = "HealthManager\n당신의 운동 루틴을 관리해드립니다."
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.textColor = .init(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
        $0.numberOfLines = 0
    }
    
    private let staffEmailLabel = UILabel().then {
        $0.text = "관리자 이메일\nsunghun4777@gmail.com  |  min50875@gmail.com"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.textColor = .init(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
        $0.numberOfLines = 0
        
    }
    
    
    private let joggingImg = UIImageView().then {
        $0.image = UIImage(named: "joggingImg")
        $0.contentMode = .scaleAspectFill
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.98, green: 0.98, blue: 1, alpha: 1)
        profileTableView.dataSource = self
        
        viewModel.readThisWeekData()
    }
    
    override func viewDidLayoutSubviews() {
        
        let set = LineChartDataSet(entries: viewModel.entries, label: "이번 주")
        let set2 = LineChartDataSet(entries: viewModel.entries2, label: "저번 주")
        
        let data = LineChartData(dataSets: [set, set2])
        
        set.mode = .horizontalBezier
        set.lineWidth = 2.5
        set.setColors(HealthManagerAsset.hmPrimary.color)
        set.circleHoleRadius = 4.0
        set.circleRadius = 4.0
        set.circleColors = [HealthManagerAsset.hmPrimary.color]
        
        set2.mode = .horizontalBezier
        set2.lineWidth = 2.5
        set2.setColors(.gray)
        set2.circleHoleRadius = 4.0
        set2.circleRadius = 4.0
        set2.circleColors = [.gray]
        
        lineChartView.data = data
        
        changeIntroduceProjectFont()
    }
    
    //뷰가 나타나기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.profileTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    //화면에 나타난 직후
    override func viewWillDisappear(_ animated: Bool) {
        self.profileTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newValue = change?[.newKey] as? CGSize {
                    profileTableView.snp.updateConstraints {
                        $0.height.equalTo(newValue.height)
                    }
                }
            }
        }
    }
    
    override func addView() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubviews(lineChartView, profileTableView, introduceProjectLabel, staffEmailLabel, staffEmailLabel, joggingImg)
    }
    
    override func setLayout() {
        contentScrollView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.centerX.width.top.bottom.equalToSuperview()
        }
        
        lineChartView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(64)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        profileTableView.snp.makeConstraints {
            $0.top.equalTo(lineChartView.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(98)
        }
        
        joggingImg.snp.makeConstraints {
            $0.top.equalTo(profileTableView.snp.bottom).inset(-30)
            $0.trailing.equalToSuperview().inset(-13)
            $0.bottom.equalToSuperview().inset(-10)
            $0.width.equalTo(138)
            $0.height.equalTo(101)
        }
        
        introduceProjectLabel.snp.makeConstraints {
            $0.top.equalTo(profileTableView.snp.bottom).inset(-25)
            $0.leading.equalToSuperview().inset(20)
        }
        
        staffEmailLabel.snp.makeConstraints {
            $0.top.equalTo(introduceProjectLabel.snp.bottom).offset(34)
            $0.leading.equalTo(introduceProjectLabel.snp.leading)
        }
    }
    
    override func bindVM() {
        viewModel.dismissBtn.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.lineChartView.reloadInputViews()
            }
        }
    }
    
    func changeIntroduceProjectFont() {
        guard let introduceText = introduceProjectLabel.text else { return }
        guard let staffEmailtext = staffEmailLabel.text else { return }
        
        let introduceAttribute = NSMutableAttributedString(string: introduceText)
        let staffEmailAttribute = NSMutableAttributedString(string: staffEmailtext)
        
        introduceAttribute.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 11) ?? "", range: (introduceText as NSString).range(of: "당신의 운동 루틴을 관리해드립니다."))
        
        staffEmailAttribute.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 11) ?? "", range: (staffEmailtext as NSString).range(of: "sunghun4777@gmail.com  |  min50875@gmail.com"))
        
        introduceProjectLabel.attributedText = introduceAttribute
        staffEmailLabel.attributedText = staffEmailAttribute
    }
}

extension ProfileGraphVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell()}
        
        cell.titleTextLabel.text = cells[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
