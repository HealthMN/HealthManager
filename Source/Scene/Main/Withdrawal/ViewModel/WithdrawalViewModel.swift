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
            let firebase = Auth.auth()
            firebase.currentUser?.delete()
            let realm = try! Realm()
            
            try! realm.write {
                realm.deleteAll()
            }
            
            do {
                try firebase.signOut()
            } catch let error as NSError {
                print("error signing out: %@", error)
            }
            
            
            coordinator.navigate(to: .loginIsRequired)
        }
    }
    
}
