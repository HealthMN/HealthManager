import UIKit
import Then
import SnapKit

class PrivancyPolicyViewController: BaseVC<PrivancyPolicyViewModel> {
    
    private let titleLabel = UILabel().then {
        $0.text = "개인정보처리방침"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let privancyPolicyLabel = UITextView().then {
        $0.font = .systemFont(ofSize: 12)
        $0.isEditable = false
    }
    
    override func addView() {
        view.addSubviews(titleLabel, privancyPolicyLabel)
    }
    
    override func setLayout() {
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
        print(viewModel.readTxtFile())
    }
}
