import UIKit

final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginVC(viewModel: vm)
        self.nav.setViewControllers([vc], animated: true)
    }
    
    override func navigate(to step: HMStep) {
        switch step {
        case .loginIsRequired:
            navigateToLogin()
        case .signUpIsRequired:
            <#code#>
        case .mainCalendarIsRequired:
            <#code#>
        case .addAlarmIsRequired:
            <#code#>
        case .profileIsRequired:
            <#code#>
        }
    }
}

private extension MainCoordinator {
    func navigateToLogin() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginVC(viewModel: vm)
        self.nav.setViewControllers([vc], animated: true)
    }
    func navigateToSignUp() {
        let vm = SignUpViewModel(coordinator: self)
        let vc = SignUpVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }   
}
