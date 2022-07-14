import Foundation
import RealmSwift

final class AddAlarmViewModel: BaseViewModel {
        
    func selectButtonDidTap(date: Date, title: String, icon: String, week: String, index: Int) -> Bool {
        let realm = try! Realm()
        let model = Alarm(date: date, title: title, icon: icon, week: week, index: index)
        
        if model.title.isEmpty {
            return false
        }
        
        try! realm.write{
            realm.add(model)
        }        
        return true
        
    }
    
}
