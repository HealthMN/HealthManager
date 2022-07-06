import UIKit

enum Color: String, Codable, CaseIterable {
    case blue = "0"
    case green = "1"
    case orange = "2"
    case yellow = "3"
    case red = "4"
}

extension Color {
    var display: UIColor {
        switch self {
        case .blue: return UIColor.Theme.blue
        case .green: return UIColor.Theme.green
        case .orange: return UIColor.Theme.orange
        case .yellow: return UIColor.Theme.yellow
        case .red: return UIColor.Theme.red
        }
    }
}
