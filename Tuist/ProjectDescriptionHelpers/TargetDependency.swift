
import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM {
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let Inject = TargetDependency.package(product: "Inject")
    static let FirebaseAuth = TargetDependency.package(product: "FirebaseAuth")
    static let FirebaseMessaging = TargetDependency.package(product: "FirebaseMessaging")
    static let FSCalendar = TargetDependency.package(product: "FSCalendar")
    static let RealmSwift = TargetDependency.package(product: "RealmSwift")
    
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit",
        requirement: .upToNextMajor(from: "5.6.0"))
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then",
        requirement: .upToNextMajor(from: "3.0.0"))
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject",
        requirement: .upToNextMajor(from: "1.1.1"))
    static let FirebaseAuth = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk",
        requirement: .upToNextMajor(from: "9.2.0"))
    static let FirebaseMessaging = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk",
        requirement: .upToNextMajor(from: "9.2.0"))
    static let FSCalendar = Package.remote(
        url: "https://github.com/WenchaoD/FSCalendar",
        requirement: .upToNextMajor(from: "2.8.3"))
    static let RealmSwift = Package.remote(
        url: "https://github.com/realm/realm-swift",
        requirement: .upToNextMajor(from: "10.1.0"))
    
}
