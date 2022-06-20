//
//  SignUpViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/20.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import FirebaseAuth

class SignUpViewModel {
    var passwordIsVisible = Observable(false)
    var checkPasswordIsVisible = Observable(false)
    
    func passwordVisibleButtonDidTap() {
        passwordIsVisible.value.toggle()
    }
    func checkPasswordVisibleButtonDidTap() {
        checkPasswordIsVisible.value.toggle()
    }
    
    var emailTextCheck = Observable(false)
    var passwordTextCheck = Observable(false)
}
