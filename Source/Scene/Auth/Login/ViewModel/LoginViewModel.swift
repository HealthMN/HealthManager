import Foundation
import FirebaseAuth

final class LoginViewModel: BaseViewModel {
    
    var passwordIsVisible = Observable(false)
    var warningLabelisVisible = Observable(false)
    
    func passwordButtonDidTap() {
        passwordIsVisible.value.toggle()
    }
    func notAccountButtonDidTap() {
        coordinator.navigate(to: .signUpIsRequired)
    }
    
    func signInFetch(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if result != nil {
                self?.coordinator.navigate(to: .mainCalendarIsRequired({
                    
                }))
            } else {
                self?.warningLabelisVisible.value = true
            }
        }
    }
}
