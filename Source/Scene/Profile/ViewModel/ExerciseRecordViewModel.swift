//
//  ExerciseRecordViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/11.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit

class ExerciseRecordViewModel {
    var coordinator: Coordinator?
    
    var okayBtnValue = Observable(false)
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func okayBtnDidTap() {
        coordinator?.pushProfileVC()
    }
}
