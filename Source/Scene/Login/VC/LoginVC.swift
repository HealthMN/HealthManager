import UIKit
import Then
import SnapKit


class LoginVC: BaseVC {
    
    let loginTitleLabel = UILabel().then {
        $0.text = "Login"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
    let emailTextLabel = UILabel().then {
        $0.text = "Email"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
    let emailTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "이메일을 입력해주세요.")
    }
    
    let passwordTextLabel = UILabel().then {
        $0.text = "Password"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
    let passwordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 입력해주세요.")
    }
    
    override func addView() {
        view.addSubviews(loginTitleLabel, emailTextLabel, emailTextField, passwordTextLabel, passwordTextField)
    }
    
    override func setLayout() {
        loginTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(142)
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
    }
}

