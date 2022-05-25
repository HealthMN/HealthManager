import UIKit
import Then


class LoginVC: UIViewController {
    
    let loginTitleLabel = UILabel().then {
        $0.text = "Login"
        $0.font = UIFont(name: "loginTitle", size: 25)
        $0.tintColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

