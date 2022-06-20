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
    let vc = SignUpVC()
    
    func singUpAuth() {
        guard let email = vc.emailTextField.text else { return }
        guard let password = vc.passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard let user = result?.user else {
                // 실패
                print("error = \(error?.localizedDescription)")
                return print("gd")
            }
            print("Success SignUp = \(user)")
        }
    }
}
