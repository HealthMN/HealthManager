import Foundation
import RealmSwift

class AddAlarmViewModel {
        
    func selectButtonDidTap(date: Date, title: String, icon: String, week: String, index: Int) {
        let realm = try! Realm()
        let model = Alarm(date: date, title: title, icon: icon, week: week, index: index)
        
        try! realm.write{
            realm.add(model)
        }
    }
}
