import UIKit
import FirebaseAuth

final class WithdrawalViewModel: BaseViewModel {
    
    var sameTextFieldText = Observable(true)
    
    func okayBtnDidTap(phrases: String, userText: String) {
        if phrases != userText {
            sameTextFieldText.value = false
        }
        else {
            do {
                try Auth.auth().signOut()
                Auth.auth().currentUser?.delete()
                coordinator.navigate(to: .loginIsRequired)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
