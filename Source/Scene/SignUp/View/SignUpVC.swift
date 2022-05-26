import Foundation
import UIKit
import Then
import SnapKit

class SignUpVC: BaseVC {
    
    let signUpTitleLabel = UILabel().then {
        $0.text = "SignUp"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
    
    override func addView() {
        view.addSubviews(signUpTitleLabel)
    }
    
    override func setLayout() {
        signUpTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    
}
