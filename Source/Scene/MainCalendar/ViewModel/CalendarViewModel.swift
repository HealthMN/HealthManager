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
    }
    
    func pushProfileGraphVC() {
        coordinator.navigate(to: .profileGraphIsRequired)
    }
    
    func addAlarmBtnDidTap() {
        coordinator.navigate(to: .addAlarmIsRequired)
    }
    
    func nextDate(){
        var compoenet = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        compoenet.timeZone = TimeZone(abbreviation: "UTC")
        
        let date = Date()
        let dateWithoutTime = Calendar.current.date(from: compoenet)!
        
        print("date \(date)")
        print(dateWithoutTime)
        
        if date == dateWithoutTime {
            inputDateAvailable.value = true
        } else {
            inputDateAvailable.value = false
        }
    }
}
// MARK: - Extension
extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
