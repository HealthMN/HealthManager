import UIKit
import Then
import SnapKit


class LoginVC: BaseVC {
    
    let loginTitleLabel = UILabel().then {
        $0.text = "Login"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
    override func addView() {
        view.addSubview(loginTitleLabel)
    }
    
    override func setLayout() {
        loginTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(142)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func configureVC() {
        for fontFamily in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
                print(fontName)
            }
        }
    }
    
}

