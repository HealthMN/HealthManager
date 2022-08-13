import UIKit
import RealmSwift

class EditTimeViewModel: BaseViewModel {
    
    // MARK: - properties
    let realm = try! Realm()
    
    func editTimeRecord(time: Int) {
        let realm = try! Realm()
        var editExerciseRecord = realm.objects(ProfileModel.self).toArray()

        let exerciseRecord = ProfileModel(time: time)
        
        editExerciseRecord[editExerciseRecord.count - 1] = exerciseRecord
    }
}
