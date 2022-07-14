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
    
    func pushLoginVC() {
        <#code#>
    }
    
    func pushSignUpVC() {
        <#code#>
    }
    
    func setMainCalendarVC() {
        <#code#>
    }
    
    func pushProfileVC() {
        <#code#>
    }
    
    func dismissProfileVC() {
        <#code#>
    }
    
    func presentProfileGraphVC() {
        <#code#>
    }
    
    
}
