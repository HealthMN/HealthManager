enum HMStep {
    // MARK: - Global
    case dismiss(() -> Void)
    case popVC
    
    // MARK: Login
    case loginIsRequired
    case signUpIsRequired
    
    // MARK: Main
    case mainCalendarIsRequired(() -> Void)
    case addAlarmIsRequired(() -> Void)
    case profileIsRequired
    
    // MARK: Profile
    case profileGraphIsRequired
    case editTimeIsRequired
    case withdrawalIsRequired
    case privancyPolicyRequired
    case logoutIsRequired
}
