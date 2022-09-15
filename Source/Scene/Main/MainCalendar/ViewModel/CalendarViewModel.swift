import Foundation
import RealmSwift

final class CalendarViewModel: BaseViewModel {
    // MARK: - Properties
    var datasource = Observable([Alarm]())
    
    var inputDateAvailable = Observable(true)
    
    // MARK: - Method
    func getTodayTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "YYYY년 M월 dd일 EEEE"
        let dateStr = dateFormatter.string(from: date)
        
        return dateStr
    }
    
    func add() {
        let realm = try! Realm()
        let results = realm.objects(Alarm.self)
        
        self.datasource.value = results.toArray()
    }
    
    func profileBtnDidTap() {
        coordinator.navigate(to: .profileIsRequired)
        saveTodayMidnight()
    }
    
    func pushProfileGraphVC() {
        coordinator.navigate(to: .profileGraphIsRequired)
    }
    
    func addAlarmBtnDidTap() {
        coordinator.navigate(to: .addAlarmIsRequired({
            let realm = try! Realm()
            let results = realm.objects(Alarm.self)
            
            self.datasource.value = results.toArray()
        }))
    }

    func saveTodayMidnight() {
        UserDefaults.standard.set(Calendar.current.startOfDay(for: Date()), forKey: "inputDate")
    }

    func isInputDateValid() -> Bool{
        UserDefaults.standard.object(forKey: "inputDate") as? Date != Calendar.current.startOfDay(for: Date())
    }
    
    func setSwitchBtnIsOn() {
        
    }
    
    func selectButtonDidTap(date: Date, title: String, icon: String, week: String, index: Int, isOn: Bool) -> Bool {
        let realm = try! Realm()
        let model = Alarm(date: date, title: title, icon: icon, week: week, index: index, isOn: isOn)
        
        if model.title.isEmpty {
            return false
        }
        
        try! realm.write{
            realm.add(model)
        }
        return true
        
    }
}

// MARK: - Extension
extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
