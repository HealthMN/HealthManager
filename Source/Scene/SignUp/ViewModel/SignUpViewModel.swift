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
    
    var warninglabelIsVisible = Observable(false)
    var warningLabelDescription = Observable("")
    
    func passwordVisibleButtonDidTap() {
        passwordIsVisible.value.toggle()
    }
    
    func checkPasswordVisibleButtonDidTap() {
        checkPasswordIsVisible.value.toggle()
    }
    
    func passwordCompareWithCheckPassword(email: String,password: String, checkPassword: String) {
        if password != checkPassword {
            self.warninglabelIsVisible.value = true
            self.warningLabelDescription.value = "*비밀번호가 일치하지 않습니다."
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                //success
                if let result = result {
                    self?.warninglabelIsVisible.value = false
                    print("회원가입 성공")
                }
                
                //error
                if let error = error as NSError? {
                    print("error = \(error.localizedDescription)")
                    self?.warninglabelIsVisible.value = true
                    
                    switch AuthErrorCode(_nsError: error).code {
                        
                        //이미 이메일 사용중
                    case .emailAlreadyInUse:
                        self?.warningLabelDescription.value = "*이미 사용중인 이메일입니다."
                        
                        //이메일 형식이 틀림
                    case .invalidEmail:
                        self?.warningLabelDescription.value = "*이메일 형식이 올바르지 않습니다."
                        
                        //사용할 수 없는 이메일 및 비밀번호
                    case .operationNotAllowed:
                        self?.warningLabelDescription.value = "*사용할 수 없는 이메일 또는 비밀번호입니다."
                        
                        //안정성이 낮은 비밀번호 형식
                    case .weakPassword:
                        self?.warningLabelDescription.value = "*안정성이 낮은 비밀번호 형식입니다."
                    default:
                        print("그 외 다른 에러")
                    }
                }
            }
        }
    }
}
