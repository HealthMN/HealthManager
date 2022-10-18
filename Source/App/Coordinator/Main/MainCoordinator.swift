import UIKit
import FirebaseAuth

final class MainCoordinator: baseCoordinator {
    // MARK: - Start
    override func start() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            
            if auth.currentUser != nil {
                self?.navigate(to: .mainCalendarIsRequired { } )
            } else {
                self?.navigate(to: .loginIsRequired)
            }
        }
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
            presentToAlarm(closure: closure)
        case .profileGraphIsRequired:
            navigateToProfileGraph()
        case .profileIsRequired:
            navigateToProfile()
        case let .dismiss(closure):
            dismiss(closure: closure)
        case .editTimeIsRequired:
            navigateToEditTime()
        case .withdrawalIsRequired:
            navigateToWithdrawal()
        case .popVC:
            navigatePopVC()
        case .privancyPolicyRequired:
            navigateToPrivancyPolicy()
        case .logoutIsRequired:
            presentToLogoutAlert()
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
    func navigatePopVC() {
        self.nav.popViewController(animated: true)
    }
    func navigateToSignUp() {
        let vm = SignUpViewModel(coordinator: self)
        let vc = SignUpVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func navigateToMainCalendar(closure: () -> Void) {
        let vm = CalendarViewModel(coordinator: self)
        let vc = MainCalendarVC(viewModel: vm)
        self.nav.setViewControllers([vc], animated: true)
    }
    func presentToAlarm(closure: @escaping () -> Void) {
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
    func navigateToEditTime() {
        let vm = EditTimeViewModel(coordinator: self)
        let vc = EditTimeViewController(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func navigateToWithdrawal() {
        let vm = WithdrawalViewModel(coordinator: self)
        let vc = WithdrawalVC(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func navigateToPrivancyPolicy() {
        let vm = PrivancyPolicyViewModel(coordinator: self)
        let vc = PrivancyPolicyViewController(viewModel: vm)
        self.nav.pushViewController(vc, animated: true)
    }
    func presentToLogoutAlert() {
        let vm = LogoutViewModel(coordinator: self)
        
        vm.presentToLogoutAlert()
    }
}
