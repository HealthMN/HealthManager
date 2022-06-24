import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let Inject = TargetDependency.package(product: "Inject")
    static let FirebaseAuth = TargetDependency.package(product: "FirebaseAuth")
    static let FirebaseMessaging = TargetDependency.package(product: "FirebaseMessaging")
    static let FSCalendar = TargetDependency.package(product: "FSCalendar")

}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject.git",
        requirement: .upToNextMajor(from: "1.0.5"))
    static let FirebaseAuth = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk",
        requirement: .upToNextMajor(from: "8.0.0"))
    static let FirebaseMessaging = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk",
        requirement: .upToNextMajor(from: "8.0.0"))
    static let FSCalendar = Package.remote(
        url: "https://github.com/WenchaoD/FSCalendar",
        requirement: .upToNextMajor(from: "2.8.3"))
}
