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
    
    func signUpFetch(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            //error
            if let error = error as NSError? {
                print("error = \(error.localizedDescription)")
                
                switch AuthErrorCode(_nsError: error).code {
                    
                case .emailAlreadyInUse:
                    print("이미 이메일 사용중")
                    
                case .invalidEmail:
                    print("이메일 형식이 틀림")
                    
                case .operationNotAllowed:
                    print("사용할 수 없는 이메일 및 비밀번호")
                    
                case .weakPassword:
                    print("안정성이 낮은 비밀번호 형식")
                    
                default:
                    print("asf")
                }
            }
        }
    }
}
