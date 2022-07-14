import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var nav: UINavigationController
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let vc = LoginVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        vc.coordinator = self
        nav.setViewControllers([vc], animated: true)
    }
    
    func setMainCalendarVC() {
        let vc = MainCalendarVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        vc.coordinator = self
        nav.setViewControllers([vc], animated: true)
    }
    
    func pushLoginVC() {
        let vc = LoginVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        vc.coordinator =  self
        nav.popViewController(animated: true)
    }
    
    func pushSignUpVC() {
        let vc = SignUpVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        nav.pushViewController(vc, animated: true)
    }
    
    func pushProfileVC() {
        let vc = ProfileGraphVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        nav.pushViewController(vc, animated: true)
    }
    
    func dismissProfileVC() {
        nav.dismiss(animated: true)
    }
    
    func presentProfileGraphVC() {
        let vc = ProfileVC(viewModel: .init(coordinator: MainCoordinator(nav: nav)))
        vc.modalPresentationStyle = .fullScreen
        nav.present(vc, animated: true)
    }
}
