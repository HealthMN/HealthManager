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
    
    func pushProfileGraphVC() {
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
        pushProfileGraphVC()
        coordinator.nav.dismiss(animated: true)
        dismissBtnDidTap()
    }
    
    func cellDidSelect(index: IndexPath.Index) {
        switch index{
        case 0: coordinator.navigate(to: .editTimeIsRequired)
        case 1: coordinator.navigate(to: .withdrawalIsRequired)
        default:
            return
        }
    }
}
