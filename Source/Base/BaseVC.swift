import UIKit

class BaseVC: UIViewController{
    let bound = UIScreen.main.bounds

    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        addView()
        setLayout()
        configureVC()
        bindState()
    }

    func setup(){}
    func addView(){}
    func setLayout(){}
    func configureVC(){}
    func bindState(){}
}
