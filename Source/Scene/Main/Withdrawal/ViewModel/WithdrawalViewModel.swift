import UIKit
import RealmSwift
import FirebaseAuth

final class WithdrawalViewModel: BaseViewModel {
    
    var sameTextFieldText = Observable(true)
    
    func okayBtnDidTap(phrases: String, userText: String) {
        let firebase = Auth.auth()
        
        if phrases != userText {
            sameTextFieldText.value = false
        }
        else {
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
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            print("Delete All alarm")
            
            coordinator.navigate(to: .loginIsRequired)
        }
    }
}
