import UIKit
import RealmSwift
import Charts

final class ProfileViewModel: BaseViewModel {
    
    // MARK: - Properties
    let realm = try! Realm()
    var entries = [ChartDataEntry]()
    var entries2 = [ChartDataEntry]()
    
    var dismissBtn = Observable(false)
    
    var inputDateAvailable = Observable(true)
    
    // MARK: - method
    func dismissBtnDidTap() {
        dismissBtn.value.toggle()
    }
    
    func pushProfileVC() {
        coordinator.navigate(to: .profileGraphIsRequired)
    }
    
    func saveProfileTime(time: Int) {
        let realm = try! Realm()
        let exerciseRecord = ProfileModel(time: time)
        
        try! realm.write {
            realm.add(exerciseRecord)
        }
    }
    
    func readThisWeekData() {
        let list = realm.objects(ProfileModel.self).toArray()
        
        if list.count >= 14 {
            
            for i in list.count - 7..<list.count {
                entries.append(ChartDataEntry(x: Double(i), y: Double(list[i].time)))
                entries2.append(ChartDataEntry(x: Double(i), y: Double(list[i - 7].time)))
            }
        } else {
            for i in 0..<list.count {
                entries.append(ChartDataEntry(x: Double(i), y: Double(list[i].time)))
            }
        }
    }
    
    func dismiss() {
        pushProfileVC()
        coordinator.nav.dismiss(animated: true)
        dismissBtnDidTap()
    }
    
    func nextDate(){
        var compoenet = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        compoenet.timeZone = TimeZone(abbreviation: "UTC")
        
        let dateWithoutTime = Calendar.current.date(from: compoenet)!
        
        let date = Date()
        
        print("date \(date)")
        print(dateWithoutTime)
        
        if date == dateWithoutTime {
            inputDateAvailable.value = true
            print("present 됨")
        } else {
            inputDateAvailable.value = false
            print("present 안됨")
        }
    }
}
