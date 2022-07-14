import UIKit

protocol Coordinator: AnyObject {
    var nav: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func navigate(to step: HMStep)
    func removeChildCoordinators()
}
