import UIKit
import Firebase
import FirebaseAuth

final class WithdrawalViewModel: BaseViewModel {
    
    var warningView = WarningView()
    
    func okayBtnDidTap(phrases: String, userText: String) {
        if phrases != userText {
            WarningView().setWarningLabel(text: "asdf")
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
