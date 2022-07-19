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
        coordinator.navigate(to: .addAlarmIsRequired)
    }

    func saveTodayMidnight() {
        UserDefaults.standard.set(Calendar.current.startOfDay(for: Date()), forKey: "inputDate")
    }
    

    func isInputDateValid() -> Bool{
        UserDefaults.standard.object(forKey: "inputDate") as? Date != Calendar.current.startOfDay(for: Date())
    }

//
//    func saveDate() {
//        UserDefaults.standard.set(Date() - 1, forKey: "yesterdayDate")
//        print("ㅁㅁㅁㅁㅁㅁ\(UserDefaults.standard.string(forKey: "yesterdayDate"))")
//    }
//    func isInputdateValid() {
//        inputDateAvailable.value = UserDefaults.standard.bool(forKey: "inputDateValue")
//        print("userdefaults = \(UserDefaults.standard.bool(forKey: "inputDateValue"))")
//    }
}

// MARK: - Extension
extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
