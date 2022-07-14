import UIKit
import RealmSwift
import Charts

class ProfileViewModel {
    var coordinator: Coordinator?
    
    let realm = try! Realm()
    var entries = [ChartDataEntry]()
    var entries2 = [ChartDataEntry]()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
class ProfileViewModel: BaseViewModel {
    func presentProfileVC() {
        coordinator.navigate(to: .profileIsRequired)
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
                entries2.append(ChartDataEntry(x: Double(i), y: Double(list[i].time)))
            }
        }
    }
    
    func dismiss() {
        coordinator.nav.dismiss(animated: true)
    }
}
