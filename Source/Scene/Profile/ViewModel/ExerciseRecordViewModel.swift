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
    
    func keyboardUnlock(textFieldType: UITextField) {
        
        if textFieldType.text?.count ?? 0 >= 2 {
            textFieldType.resignFirstResponder()
            print("2개 이상!")
        }
        
        print("sdf")
    }
}
