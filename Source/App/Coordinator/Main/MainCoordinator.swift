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
    func navigateToMainCalendar() {
        let vm = CalendarViewModel(coordinator: self)
        let vc = MainCalendarVC(viewModel: vm)
        self.nav.setViewControllers([vc], animated: true)
    }
    func navigateToAddAlarm() {
        let vm = AddAlarmViewModel(coordinator: self)
        let vc = AddAlarmVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func navigateToProfile() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
}
