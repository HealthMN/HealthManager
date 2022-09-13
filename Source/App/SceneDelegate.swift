import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScence = (scene as? UIWindowScene) else { return }
        
        let nav = UINavigationController()
        
        window = UIWindow(windowScene: windowScence)
        window?.windowScene = windowScence
        window?.rootViewController = nav
        coordinator = MainCoordinator(nav: nav)
        coordinator?.start()
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
        // 앱을 열어 scene 이 active 되었을 때 badge 없앰
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    
                    let nContent = UNMutableNotificationContent()
                    
                    nContent.title = "jl"
                    nContent.body = "sadfda"
                    
                    var date = DateComponents()
                    date.hour = 14
                    date.minute = 23
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
                    // 알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    // NotificationCenter에 추가
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                } else {
                    NSLog("User not agree")
                }
                
            }
        }  else {
            NSLog("User iOS Version lower than 13.0. please update your iOS version")
        }
        
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
    }
}
    
