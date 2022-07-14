import UIKit
import RealmSwift

class ProfileViewModel: BaseViewModel {
    func presentProfileVC() {
        coordinator.navigate(to: .profileIsRequired)
    }
    
    func saveProfileTime(time: Int) {
        let realm = try! Realm()
        let exerciseRecord = ProfileModel(time: time)
        
        try! realm.write {
            realm.add(exerciseRecord)
        }
    }
    
    func dismiss() {
        coordinator.nav.dismiss(animated: true)
    }
}
