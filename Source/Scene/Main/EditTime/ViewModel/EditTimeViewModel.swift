import UIKit
import RealmSwift

class EditTimeViewModel: BaseViewModel {
    
    // MARK: - properties
    let realm = try! Realm()
    
    func editTimeRecord(time: Int) {
        let realm = try! Realm()
        let editExerciseRecord = realm.objects(ProfileModel.self).toArray()

        var exerciseRecord = ProfileModel(time: time)
        let timeRecordLastIndex = editExerciseRecord.count - 1
    }
}
