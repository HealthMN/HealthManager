import UIKit

final class MainCoordinator: baseCoordinator {
    // MARK: - Start
    override func start() {
//        let vm = LoginViewModel(coordinator: self)
//        let vc = LoginVC(viewModel: vm)
        
        let vm = EditTimeViewModel(coordinator: self)
        let vc = EditTimeViewController(viewModel: vm)
        
        self.nav.setViewControllers([vc], animated: true)
    }
    // MARK: - Navigate
    override func navigate(to step: HMStep) {
        switch step {
        case .loginIsRequired:
            navigateToLogin()
        case .signUpIsRequired:
            navigateToSignUp()
        case let .mainCalendarIsRequired(closure):
            navigateToMainCalendar(closure: closure)
        case let .addAlarmIsRequired(closure):
            navigateToAddAlarm(closure: closure)
        case .profileGraphIsRequired:
            navigateToProfileGraph()
        case .profileIsRequired:
            navigateToProfile()
        case let .dismiss(closure):
            dismiss(closure: closure)
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
    func navigateToMainCalendar(closure: () -> ()) {
        let vm = CalendarViewModel(coordinator: self)
        let vc = MainCalendarVC(viewModel: vm)
        self.nav.setViewControllers([vc], animated: true)
    }
    func navigateToAddAlarm(closure: @escaping () -> ()) {
        let vm = AddAlarmViewModel(coordinator: self, closure: closure)
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
    func dismiss(closure: @escaping () -> Void) {
        self.nav.visibleViewController?.dismiss(animated: true, completion: closure)
    }
}
