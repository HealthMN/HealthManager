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
        $0.font = UIFont(name: "AppleSDGothicNeo", size: 14)
    }
    
    let emailTF = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "이메일을 입력해주세요.")
    }
    
    override func addView() {
        
    }
    
    override func setLayout() {
        loginTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(142)
            $0.centerX.equalToSuperview()
        }
    }
}

