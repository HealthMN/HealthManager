import Foundation
import FirebaseAuth

final class SignUpViewModel: BaseViewModel {
    
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
                if result != nil {
                    self?.warninglabelIsVisible.value = false
                    self?.coordinator.navigate(to: .popVC)
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
