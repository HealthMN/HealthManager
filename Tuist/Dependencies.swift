import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.6.0")),
        .remote(url: "https://github.com/devxoul/Then.git", requirement: .upToNextMajor(from: "3.0.0")),
        .remote(url: "https://github.com/krzysztofzablocki/Inject.git", requirement: .upToNextMajor(from: "1.0.5"))
    ], platforms: [.iOS]
)
