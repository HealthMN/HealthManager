import UIKit
import RealmSwift

class EditTimeViewModel: BaseViewModel {
    
    // MARK: - properties
    let realm = try! Realm()
    
    // MARK: - Method
    func editTimeRecord(time: Int) {
        var editExerciseRecord = realm.objects(ProfileModel.self).toArray()

        let exerciseRecord = ProfileModel(time: time)
        
        editExerciseRecord[editExerciseRecord.count - 1] = exerciseRecord
        print("edit")
    }
}
