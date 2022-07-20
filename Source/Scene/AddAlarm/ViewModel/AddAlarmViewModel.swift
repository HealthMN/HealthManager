import RealmSwift
import UIKit

final class AddAlarmViewModel: BaseViewModel {
    
    private let closure: () -> Void
    
    init(coordinator: baseCoordinator, closure: @escaping () -> Void) {
        self.closure = closure
        super.init(coordinator: coordinator)
    }
        
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
    
    func dismiss() {
        coordinator.navigate(to: .dismiss({ [weak self] in
            self?.closure()
        }))
    }
}
