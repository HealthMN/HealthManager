import Foundation
import RealmSwift

final class ProfileModel: Object {
    @Persisted var time: Int
    
    convenience init(time: Int) {
        self.init()
        self.time = time
    }
}
