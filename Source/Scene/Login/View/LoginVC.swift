import UIKit
import Then
import SnapKit
import Firebase
import FirebaseAuth

class LoginVC: BaseVC {
    
    private lazy var passwordEyeIconBool = true
    
    private let loginTitleLabel = UILabel().then {
        $0.text = "Login"
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
    
    private let eyeIconBtn = UIButton().then {
        $0.setImage(UIImage(named: "EyeIcon")?.resize(newWidth: 22), for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(passwordEyeIconClickEvent(_:)), for: .touchUpInside)
    }
    
    private let findPaaswordBtn = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.setTitleColor(.gray, for: .normal)
    }
    
    private let loginBtn = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.backgroundColor = HealthManagerAsset.hmPrimary.color
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(clickLoginBtn(_:)), for: .touchUpInside)
    }
    
    private let notAccountBtn = UIButton().then {
        $0.setTitle("계정이 없으신가요?", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.setTitleColor(.gray, for: .normal)
        $0.addTarget(self, action: #selector(pushSignUpVC(_:)), for: .touchUpInside)
    }
    
    // MARK: - method
    @objc func passwordEyeIconClickEvent(_ sender: UIButton) {
        passwordEyeIconBool.toggle()
        print(passwordEyeIconBool)
        
        passwordTextField.isSecureTextEntry = passwordEyeIconBool ? true : false
        eyeIconBtn.setImage(UIImage(named: passwordEyeIconBool ? "EyeIcon" : "EyeIconBlack")?.resize(newWidth: 22), for: .normal)
    }
    
    @objc func pushSignUpVC(_ sender: UIButton) {
        let vc = SignUpVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func clickLoginBtn(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if result != nil {
                let vc = MainCalendarVC()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
                
            } else {
                print("Login Filed")
            }
            
        }
    }
    
    override func addView() {
        view.addSubviews(loginTitleLabel, emailTextLabel, emailTextField, passwordTextLabel,
                         passwordTextField, eyeIconBtn, findPaaswordBtn, loginBtn, notAccountBtn)
    }
    
    override func setLayout() {
        loginTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
        }
        
        emailTextLabel.snp.makeConstraints {
            $0.top.equalTo(loginTitleLabel.snp.bottom).offset(78)
            $0.leading.equalToSuperview().inset(56)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.equalTo(emailTextLabel.snp.leading)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        eyeIconBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.top)
            $0.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        findPaaswordBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
            $0.leading.equalTo(passwordTextField.snp.leading)
        }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(96)
            $0.leading.trailing.equalToSuperview().inset(60)
            $0.height.equalTo(45)
        }
        
        notAccountBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(68)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(14)
        }
    }
}

