import UIKit

class baseCoordinator: Coordinator {
    var nav: UINavigationController
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    init(nav: UINavigationController){
        self.nav = nav
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    
    func start() {
        fatalError("Start method should be implemented")
    }
    
    func start(coodinator: Coordinator) {
        childCoordinators += [coodinator]
        coodinator.parentCoordinator = self
        coodinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        if let idx = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: idx)
        }
    }
    
    func navigate(to step: HealthStep){
        
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach{ $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
    
}
