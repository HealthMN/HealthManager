//
//  ExerciseRecordViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/11.
//  Copyright © 2022 com.tm. All rights reserved.
//
import UIKit
import RealmSwift
import Charts

class ProfileViewModel {
    var coordinator: Coordinator?
    
    let realm = try! Realm()
    var entries = [ChartDataEntry]()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func saveProfileTime(time: Int) {
        let realm = try! Realm()
        let exerciseRecord = ProfileModel(time: time)
        
        try! realm.write {
            realm.add(exerciseRecord)
        }
    }
    
    func readData() {
        let list = realm.objects(ProfileModel.self).toArray()
        
        for i in list.count - 7..<list.count {
            entries.append(ChartDataEntry(x: Double(i), y: Double(list[i].time)))
        }
    }
}
