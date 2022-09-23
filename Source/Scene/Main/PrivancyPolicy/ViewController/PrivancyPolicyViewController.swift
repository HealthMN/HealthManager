import UIKit
import Then
import SnapKit

class PrivancyPolicyViewController: BaseVC<PrivancyPolicyViewModel> {
    
    private let contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.text = "개인정보처리방침"
    }
    
    private let privancyPolicyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.numberOfLines = 0
//        $0.sizeToFit()
    }
    
    override func addView() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubviews(titleLabel, privancyPolicyLabel)
    }
    
    override func setLayout() {
        contentScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
//            $0.centerX.top.bottom.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(30)
        }
        
        privancyPolicyLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func configureVC() {
        viewModel.readTxtFile()
        privancyPolicyLabel.text = viewModel.result
        contentScrollView.updateContentSize()
        print(viewModel.readTxtFile())
    }
}
