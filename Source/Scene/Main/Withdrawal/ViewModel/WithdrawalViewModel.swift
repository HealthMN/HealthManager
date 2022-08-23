import UIKit
import FirebaseAuth

final class WithdrawalViewModel: BaseViewModel {
    
    var sameTextFieldText = Observable(true)
    
    func okayBtnDidTap(phrases: String, userText: String) {
        if phrases != userText {
            sameTextFieldText.value = false
        }
        else {
            Auth.auth().currentUser?.delete()
            coordinator.navigate(to: .loginIsRequired)
        }
    }
    
}
