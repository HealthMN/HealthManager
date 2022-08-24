import UIKit
import RealmSwift

class EditTimeViewModel: BaseViewModel {
    
    // MARK: - properties
    let realm = try! Realm()

    // MARK: - Method
    func editTimeRecord(time: Int) {
        let editExerciseRecord = realm.objects(ProfileModel.self).last
        let exerciseRecord = ProfileModel(time: time).time

        try! realm.write {
            editExerciseRecord?.time = exerciseRecord
        }
        self.coordinator.nav.popViewController(animated: true)
    }
}
