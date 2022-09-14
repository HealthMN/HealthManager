//
//  UNUserNotificationCenter.swift
//  HealthManager
//
//  Created by 민도현 on 2022/09/13.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import UserNotifications
import SwiftUI

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alarm) {
        let content = UNMutableNotificationContent()
        content.title = "HealthManager"
        content.body = "헬스가기"
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        
//        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
//        self.add(request, withCompletionHandler: nil)
    }
}
