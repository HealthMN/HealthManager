import Foundation
import RealmSwift

final class Alarm: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var date: Date
    @Persisted var title: String
    @Persisted var icon: String
    @Persisted var week: String
    @Persisted var index: Int
    
    convenience init(date: Date, title: String, icon: String, week: String, index: Int) {
        self.init()
        self.id = UUID().uuidString
        self.date = date
        self.title = title
        self.icon = icon
        self.week = week
        self.index = index
    }
}
