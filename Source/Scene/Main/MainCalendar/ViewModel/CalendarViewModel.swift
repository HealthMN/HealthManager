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
}

// MARK: - Extension
extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
