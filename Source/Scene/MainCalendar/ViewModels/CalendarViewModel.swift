//
//  CalendarVM.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/30.
//  Copyright © 2022 com.tm. All rights reserved.
//
import Foundation
import RealmSwift

class CalendarViewModel {
    
    var datasource = Observable([Alarm]())
    
    func getTodayTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko")
        dateFormatter.dateFormat = "YYYY년 M월 dd일 EEEE"
        let dateStr = dateFormatter.string(from: date)
        
        return dateStr
    }
    
    func add() {        
        let results = try! Realm().objects(Alarm.self)
        
        self.datasource.value = results.toArray()
        
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
