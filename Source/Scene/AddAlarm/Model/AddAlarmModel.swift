import Foundation
import RealmSwift

class AddAlarmModel: Object {
    @Persisted var date: Date
    @Persisted var title: String
    @Persisted var icon: String
    @Persisted var week: String
    
    convenience init(date: Date, title: String, icon: String, week: String) {
        self.init()
        self.date = date
        self.title = title
        self.icon = icon
        self.week = week
    }
}
