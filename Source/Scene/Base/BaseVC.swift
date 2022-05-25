import UIKit

class BaseVC: UIViewController{
    let bound = UIScreen.main.bounds

    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(cgColor: CGColor(red: 1.0, green: 0.98, blue: 0.984, alpha: 1))
        setup()
        addView()
        setLayout()
        configureVC()
    }

    func setup(){}
    func addView(){}
    func setLayout(){}
    func configureVC(){}
}
