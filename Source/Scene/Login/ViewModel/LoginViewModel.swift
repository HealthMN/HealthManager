//
//  LoginViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/22.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation

class LoginViewModel {
    var passwordIsVisible = Observable(false)
    
    func passwordButtonDidTap() {
        passwordIsVisible.value.toggle()
    }
}
