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
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    //    func notInputTextFieldText(_ textField: UITextField) {
    //        if let textfield = textField.text, textField1?.text  {
    //            coordinator?.setProfileVC()
    //        } else {
    //            textField.shake()
    //        }
    //    }
    
        func okayBtnDidTap(hoursTextField: String, minutesTextField: String) {
            coordinator?.setProfileVC()
    }
}
