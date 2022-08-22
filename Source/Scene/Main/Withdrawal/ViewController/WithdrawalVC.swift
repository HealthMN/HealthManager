import UIKit
import Then
import SnapKit

final class WithdrawalVC: BaseVC<WithdrawalViewModel> {
    // MARK: - Properties
    private let contextView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    private let withdrawalTitleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.text = "회원탈퇴"
        $0.textColor = .black
    }
    
    private let withdrawalDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.text = "회원탈퇴를 원하시면\n아래의 문구를 똑같이 입력해주세요"
        $0.numberOfLines = 0
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    
    private let phrasesLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.text = "회원탈퇴"
        $0.textColor = .red
    }
    
    private let phrasesTextField = UITextField().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.textColor = .black
        $0.backgroundColor = .init(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
    }
    
    private lazy var okayBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.backgroundColor = .init(red: 0.95, green: 0.96, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(okayBtnDidTap(_:)), for: .touchUpInside)
    }
    
    private let warningView = UILabel().then {
        $0.textColor = .init(red: 1, green: 0.37, blue: 0.37, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        $0.text = "아래의 문구를 똑같이 입력해주세요"
        $0.textAlignment = .center
        $0.isHidden = true
    }
    
    // MARK: - method
    @objc private func okayBtnDidTap(_ sender: UIButton) {
        viewModel.okayBtnDidTap(phrases: phrasesLabel.text!, userText: phrasesTextField.text ?? "")
    }
    
    // MARK: - UI
    override func setup() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    }
    
    override func addView() {
        view.addSubviews(contextView)
        contextView.addSubviews(withdrawalTitleLabel, withdrawalDescriptionLabel, phrasesLabel, phrasesTextField, warningView, okayBtn)
    }
    
    override func setLayout() {
        contextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(330)
            $0.top.equalToSuperview().inset(173)
        }
        
        withdrawalTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        withdrawalDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(withdrawalTitleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        phrasesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
        
        phrasesTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(128)
            $0.leading.trailing.equalToSuperview().inset(37)
            $0.height.equalTo(51)
        }

        warningView.snp.makeConstraints {
            $0.top.equalTo(phrasesTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        okayBtn.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
    }
    
    // MARK: - bind
    override func bindVM() {
        viewModel.sameTextFieldText.bind { [weak self] visible in
            DispatchQueue.main.async {
                self?.warningView.isHidden = visible ? true : false
            }
        }
    }
}
