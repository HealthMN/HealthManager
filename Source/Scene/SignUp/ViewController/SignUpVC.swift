import Foundation
import UIKit
import Then
import SnapKit
import Firebase
import FirebaseAuth

class SignUpVC: BaseVC {
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewModel: SignUpViewModel
    
    private let signUpTitleLabel = UILabel().then {
        $0.text = "SignUp"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        $0.textColor = HealthManagerAsset.hmPrimary.color
    }
    
    private let emailTextLabel = UILabel().then {
        $0.text = "Email"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = HealthManagerAsset.hmPrimary.color
    }
    
    private let emailTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "이메일을 입력해주세요.")
    }
    
    private let passwordTextLabel = UILabel().then {
        $0.text = "Password"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = HealthManagerAsset.hmPrimary.color
    }
    
    private let passwordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 입력해주세요.")
        $0.isSecureTextEntry = true
    }
    
    private lazy var passwordEyeIconBtn = UIButton().then {
        $0.setImage(UIImage(named: "EyeIcon")?.resize(newWidth: 22), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(passwordEyeIconClickEvent(_:)), for: .touchUpInside)
    }
    
    private let checkPasswordTextLabel = UILabel().then {
        $0.text = "Password Check"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = HealthManagerAsset.hmPrimary.color
    }
    
    private let checkPasswordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 확인해주세요.")
        $0.isSecureTextEntry = true
    }
    
    private lazy var checkPasswordEyeIconBtn = UIButton().then {
        $0.setImage(UIImage(named: "EyeIcon")?.resize(newWidth: 22), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(checkPasswordEyeIconClickEvent(_:)), for: .touchUpInside)
    }
    
    private lazy var signUpBtn = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.backgroundColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(clickSignUpBtn(_:)), for: .touchUpInside)
    }
    
    // MARK: - method
    @objc func passwordEyeIconClickEvent(_ sender: UIButton) {
        viewModel.passwordVisibleButtonDidTap()
    }
    
    @objc func checkPasswordEyeIconClickEvent(_ sender: UIButton) {
        viewModel.checkPasswordVisibleButtonDidTap()
    }
    
    @objc func clickSignUpBtn(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            //error
            if let error = error as NSError? {
                print("error = \(error.localizedDescription)")
                
                switch AuthErrorCode(_nsError: error).code {
                    
                case .emailAlreadyInUse:
                    print("이미 이메일 사용중")
                    
                case .invalidEmail:
                    print("이메일 형식이 틀림")
                    self.emailTextField.shake()
                    
                case .operationNotAllowed:
                    print("사용할 수 없는 이메일 및 비밀번호")
                    
                case .weakPassword:
                    print("안정성이 낮은 비밀번호 형식")
                    
                default:
                    print("asf")
                }
            }
        }
    }
    
    override func addView() {
        view.addSubviews(signUpTitleLabel, emailTextLabel, emailTextField, passwordTextLabel, passwordTextField, passwordEyeIconBtn, checkPasswordTextLabel, checkPasswordTextField, checkPasswordEyeIconBtn, signUpBtn)
    }
    
    override func setLayout() {
        signUpTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(signUpTitleLabel.snp.bottom).offset(78)
            $0.leading.equalToSuperview().inset(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextField.snp.leading)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        passwordEyeIconBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top)
            $0.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        checkPasswordTextLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.equalTo(passwordTextLabel.snp.leading)
        }
        
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        checkPasswordEyeIconBtn.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextField.snp.top)
            $0.trailing.equalTo(checkPasswordTextField.snp.trailing)
        }
        
        signUpBtn.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextField.snp.bottom).offset(96)
            $0.leading.trailing.equalToSuperview().inset(60)
            $0.height.equalTo(45)
        }
    }
    
    override func bindState() {
        viewModel.passwordIsVisible.bind { [weak self] visible in
            DispatchQueue.main.async {
                self?.passwordEyeIconBtn.setImage(.init(named: visible ? "EyeIconBlack" : "EyeIcon")?.resize(newWidth: 22), for: .normal)
                
                self?.passwordTextField.isSecureTextEntry = visible ? false : true
            }
        }
        viewModel.checkPasswordIsVisible.bind { [weak self] visible in
            DispatchQueue.main.async {
                self?.checkPasswordEyeIconBtn.setImage(.init(named: visible ? "EyeIconBlack" : "EyeIcon")?.resize(newWidth: 22), for: .normal)
                
                self?.checkPasswordTextField.isSecureTextEntry = visible ? false : true
            }
        }
    }
}
