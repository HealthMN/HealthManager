import Foundation
import RealmSwift

class Alarm: Object {
    @Persisted var date: Date
    @Persisted var title: String
    @Persisted var icon: String
    @Persisted var week: String
    @Persisted var index: Int
    
    convenience init(date: Date, title: String, icon: String, week: String, index: Int) {
        self.init()
        self.date = date
        self.title = title
        self.icon = icon
        self.week = week
        self.index = index
    }
}
