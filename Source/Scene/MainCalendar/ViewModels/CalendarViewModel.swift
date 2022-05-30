//
//  CalendarVM.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/30.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation

class CalendarViewModel: BaseVC {
    
    func getTodayTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "M월 dd일 EEEE"
        let dateStr = dateFormatter.string(from: date)
        
        return dateStr
    }
}
