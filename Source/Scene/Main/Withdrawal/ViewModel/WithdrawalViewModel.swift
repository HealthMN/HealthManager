import UIKit
import RealmSwift
import FirebaseAuth

final class WithdrawalViewModel: BaseViewModel {
    
    var sameTextFieldText = Observable(true)
    
    func okayBtnDidTap(phrases: String, userText: String) {
        if phrases != userText {
            sameTextFieldText.value = false
        }
        else {
            Auth.auth().currentUser?.delete()
            let realm = try! Realm()
            
            try! realm.write {
                realm.deleteAll()
            }
            coordinator.navigate(to: .loginIsRequired)
        }
    }
    
}
