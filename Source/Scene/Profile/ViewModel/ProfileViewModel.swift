import UIKit
import RealmSwift
import Charts

class ProfileViewModel: BaseViewModel {
    
    let realm = try! Realm()
    var entries = [ChartDataEntry]()
    var entries2 = [ChartDataEntry]()
    
    var dismissBtn = Observable(false)
    
    func dismissBtnDidTap() {
        dismissBtn.value.toggle()
    }

    func presentProfileVC() {
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
                entries2.append(ChartDataEntry(x: Double(i), y: Double(list[i].time)))
            }
        }
    }
    
    func dismiss() {
        presentProfileVC()
        coordinator.nav.dismiss(animated: true)
        dismissBtnDidTap()
    }
}
