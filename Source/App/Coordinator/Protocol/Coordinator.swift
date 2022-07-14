import UIKit

protocol Coordinator: AnyObject {
    var nav: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func pushLoginVC()
    func pushSignUpVC()
    func setMainCalendarVC()
    func pushProfileVC()
    func dismissProfileVC()
    func presentProfileGraphVC()
}
