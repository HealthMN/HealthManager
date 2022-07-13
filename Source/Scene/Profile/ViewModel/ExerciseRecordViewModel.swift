//
//  ExerciseRecordViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/11.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ExerciseRecordViewModel {
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func saveProfileTime(time: Int) {
        let realm = try! Realm()
        let exerciseRecord = ExerciseRecordModel(time: time)
        
        try! realm.write {
            realm.add(exerciseRecord)
        }
    }
}
