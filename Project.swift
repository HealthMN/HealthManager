import ProjectDescription

let projectName = "HealthManager"
let organizationName = "com.tm"

let project = Project(
    name: projectName,
    organizationName: organizationName,
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
                .external(name: "Then"),
                .external(name: "SnapKit"),
                .external(name: "Inject")
            ]
        )
    ]
)
