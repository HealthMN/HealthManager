import UIKit
import RealmSwift

class EditTimeViewModel: BaseViewModel {
    
    // MARK: - properties
    let realm = try! Realm()
    
    // MARK: - Method
    func editTimeRecord(time: Int) {
        let editExerciseRecord = realm.objects(ProfileModel.self).last
        let exerciseRecord = ProfileModel(time: time)
        
        
        try! realm.write {
            editExerciseRecord?.time = 0
        }

//
//
//        editExerciseRecord[editExerciseRecord.count - 1] = exerciseRecord
//        print(editExerciseRecord[editExerciseRecord.count - 1])
//        print("edit")
        
        
    }
}
