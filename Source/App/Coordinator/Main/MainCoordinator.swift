import UIKit

final class MainCoordinator: baseCoordinator {
    // MARK: - Start
    override func start() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginVC(viewModel: vm)
        
        self.nav.setViewControllers([vc], animated: true)
    }
    // MARK: - Navigate
    override func navigate(to step: HMStep) {
        switch step {
        case .loginIsRequired:
            navigateToLogin()
        case .signUpIsRequired:
            navigateToSignUp()
        case .mainCalendarIsRequired:
            navigateToMainCalendar()
        case .addAlarmIsRequired:
            navigateToAddAlarm()
        case .profileGraphIsRequired:
            navigateToProfileGraph()
        case .profileIsRequired:
            navigateToProfile()
        }
    }
}
// MARK: - extension
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
        self.nav.visibleViewController?.present(vc, animated: true)
    }
    func navigateToProfileGraph() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileGraphVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func navigateToProfile() {
        let vm = ProfileViewModel(coordinator: self)
        let vc = ProfileVC(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        self.nav.visibleViewController?.present(vc, animated: true)
    }
}
