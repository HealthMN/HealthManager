import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
    func pushLoginVC()
    func pushSignUpVC()
    func setMainCalendarVC()
    func pushProfileVC()
    func dismissProfileVC()
    func presentProfileGraphVC()
}
