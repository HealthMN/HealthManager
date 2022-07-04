import Foundation
import RealmSwift

class AddAlarmViewModel {
    
    func selectButtonDidTap(date: Date, title: String, icon: String, week: String) {
        let realm = try! Realm()
        let model = AddAlarmModel(date: date, title: title, icon: icon, week: week)
        
        try! realm.write{
            realm.add(model)
        }
    }
}
