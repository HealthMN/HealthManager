import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "HealthManager"
let organizationName = "com.tm"

let project = Project(
    name: projectName,
    organizationName: organizationName, packages: [
        .SnapKit,
        .Then,
        .Inject,
        .FirebaseAuth,
        .FirebaseMessaging,
        .FSCalendar,
        .RealmSwift,
        .Charts
    ],
    targets: [
        Target(
            name: "\(projectName)",
            platform: .iOS,
            product: .app,
            bundleId: "\(organizationName).\(projectName)",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .file(path: Path("Support/Info.plist")),
            sources: ["Source/**"],
            resources: ["Resource/**"],
            dependencies: [
                .SPM.SnapKit,
                .SPM.Then,
                .SPM.Inject,
                .SPM.FirebaseAuth,
                .SPM.FirebaseMessaging,
                .SPM.FSCalendar,
                .SPM.RealmSwift,
                .SPM.Charts
                
            ]
        )
    ]
)
