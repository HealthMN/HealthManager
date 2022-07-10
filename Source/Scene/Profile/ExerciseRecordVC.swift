//
//  ExerciseRecordVC.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/10.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import SnapKit
import Then
import UIKit

class ExerciseRecordVC: BaseVC {
    private let contextView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘 하루 운동시간을 기록해보세요."
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    private let timerTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "00  00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        $0.keyboardType = .numberPad
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
    }
    
    private let colonLabel = UILabel().then {
        $0.text = ":"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
    }
    
    private let okayBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.backgroundColor = .init(red: 0.95, green: 0.96, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 8
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        timerTextField.delegate = self
    }
    
    override func addView() {
        view.addSubview(contextView)
        contextView.addSubviews(titleLabel, timerTextField, colonLabel, okayBtn)
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
        
        timerTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(48)
            $0.leading.equalToSuperview().inset(75)
        }
        
        colonLabel.snp.makeConstraints {
            $0.top.equalTo(timerTextField.snp.top)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(timerTextField.snp.bottom)
            $0.width.equalTo(10)
        }
        
        timerTextField.snp.makeConstraints {
            $0.top.equalTo(colonLabel.snp.top)
            $0.leading.equalTo(colonLabel.snp.trailing).offset(3)
        }
        
        okayBtn.snp.makeConstraints {
            $0.top.equalTo(timerTextField.snp.bottom).offset(84)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

extension ExerciseRecordVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let hoursTextFieldLength = timerTextField.text ?? ""
        guard let stringSRange = Range(range, in: hoursTextFieldLength) else { return false }
        
        let updateText = hoursTextFieldLength.replacingCharacters(in: stringSRange, with: string)
        print("ㅎㅎ \(hoursTextFieldLength)")
        
        return updateText.count <= 4
    }
    
}
