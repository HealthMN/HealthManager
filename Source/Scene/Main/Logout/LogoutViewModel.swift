import UIKit
import FirebaseAuth

class LogoutViewModel: BaseViewModel {
    func presentToLogoutAlert() {
        let sheet = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        
        sheet.addAction(UIAlertAction(title: "네", style: .destructive, handler: { [weak self] value in
            if value.isEnabled {
                do {
                    try Auth.auth().signOut()
                } catch(let error as NSError) {
                    print("error = \(error)")
                }
                self?.coordinator.nav.popToRootViewController(animated: true)
                
                //알림 삭제
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                print("Delete All alarm")

            }
        }))
        sheet.addAction(UIAlertAction(title: "아니요", style: .cancel))
        
        coordinator.nav.present(sheet, animated: true)
    }
}
