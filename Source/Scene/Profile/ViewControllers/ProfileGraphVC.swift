//
//  ProfileGraphVC.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/13.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import Charts
import Then
import RealmSwift
import SnapKit
import UIKit

class ProfileGraphVC: BaseVC {
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cells = ["운동시간 보기", "설정", "회원 탈퇴"]
    
    private let contentScrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let lineChartView = LineChartView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.xAxis.labelTextColor = .clear
        $0.rightAxis.enabled = false
        $0.leftAxis.labelTextColor = HealthManagerAsset.hmPrimary.color
        $0.xAxis.setLabelCount(7, force: false)
        $0.animate(xAxisDuration: 2)
        $0.xAxis.drawGridLinesEnabled = false
        $0.leftAxis.drawGridLinesEnabled = false
        $0.xAxis.labelPosition = .bottom
    }
    
    private let profileTableView = UITableView().then {
        $0.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
        $0.rowHeight = 60
        $0.layer.cornerRadius = 8
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.97, green: 0.98, blue: 0.97, alpha: 1)
        profileTableView.dataSource = self
        DispatchQueue.main.async {
            self.lineChartView.reloadInputViews()
        }
        
        viewModel.readThisWeekData()
        viewModel.coordinator?.presentProfileGraphVC()
    }
    
    override func viewDidLayoutSubviews() {
        let set = LineChartDataSet(entries: viewModel.entries, label: "이번 주")
        let set2 = LineChartDataSet(entries: viewModel.entries2, label: "저번 주")
        
        let data = LineChartData(dataSets: [set, set2])
        //        data.setDrawValues(false)
        
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
        contentView.addSubviews(lineChartView, profileTableView)
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
