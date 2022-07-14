import Foundation
import FirebaseAuth

final class LoginViewModel {
    var coordinator: Coordinator?
    
    var passwordIsVisible = Observable(false)
    var warningLabelisVisible = Observable(false)
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func passwordButtonDidTap() {
        passwordIsVisible.value.toggle()
    }
    
    func signInFetch(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if result != nil {
                self?.coordinator?.setMainCalendarVC()
            } else {
                self?.warningLabelisVisible.value = true
            }
        }
    }
}
