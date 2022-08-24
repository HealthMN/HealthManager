import SnapKit
import Then
import UIKit

final class ProfileVC: BaseVC<ProfileViewModel> {
    
    // MARK: - Properties
    private let contextView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘 하루 운동시간을 기록해보세요."
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    private let hoursTimerTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.tintColor = .clear
        $0.keyboardType = .numberPad
    }
    
    private let minutesTimerTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "30", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.tintColor = .clear
        $0.keyboardType = .numberPad
    }
    
    private let colonLabel = UILabel().then {
        $0.text = ":"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.textColor = .gray
    }
    
    private lazy var okayBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.backgroundColor = .init(red: 0.95, green: 0.96, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(okayBtnDidTap(_:)), for: .touchUpInside)
    }
    
    // MARK: - Method
    @objc private func okayBtnDidTap(_ sender: UIButton) {
        guard let hoursTimerTF = hoursTimerTextField.text else { return }
        guard let minutesTimerTF = minutesTimerTextField.text else { return }
        let time = ((Int(hoursTimerTF) ?? 0) * 60) + (Int(minutesTimerTF) ?? 30)
        viewModel.saveProfileTime(time: time)
        viewModel.dismiss()
    }
    
    // MARK: - UI
    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        hoursTimerTextField.delegate = self
        minutesTimerTextField.delegate = self
    }
    
    override func addView() {
        view.addSubview(contextView)
        contextView.addSubviews(titleLabel, hoursTimerTextField, minutesTimerTextField, colonLabel, okayBtn)
    }
    
    override func setLayout() {
        contextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(330)
            $0.top.equalToSuperview().inset(173)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.centerX.equalToSuperview()
        }
        
        hoursTimerTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(75)
        }
        
        colonLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(hoursTimerTextField.snp.height)
            $0.width.equalTo(17)
        }
        
        hoursTimerTextField.snp.makeConstraints {
            $0.top.equalTo(colonLabel.snp.top)
            $0.trailing.equalTo(colonLabel.snp.leading).offset(3)
        }
        
        minutesTimerTextField.snp.makeConstraints {
            $0.top.equalTo(hoursTimerTextField.snp.top)
            $0.leading.equalTo(colonLabel.snp.trailing).offset(3)
        }
        
        okayBtn.snp.makeConstraints {
            $0.top.equalTo(hoursTimerTextField.snp.bottom).offset(84)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

// MARK: - Extension
extension ProfileVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if Int(minutesTimerTextField.text ?? "") ?? 0 >= 60 {
            minutesTimerTextField.text = "59"
        }
        
        if Int(hoursTimerTextField.text ?? "") ?? 0 >= 24 {
            hoursTimerTextField.text = "23"
        }
        
        guard textField.text?.count ?? 0 >= 2 else {
            return
        }
        
        textField.resignFirstResponder()
    }
}
