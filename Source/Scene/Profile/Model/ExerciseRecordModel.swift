//
//  ExerciseRecordModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/13.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import RealmSwift

class ExerciseRecordModel: Object {
    @Persisted var time: Float
    
    init(time: Float) {
        self.time = time
    }
}
