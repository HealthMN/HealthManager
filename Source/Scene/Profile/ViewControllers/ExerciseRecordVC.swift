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
    
    init(viewModel: ExerciseRecordViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private var viewModel: ExerciseRecordViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contextView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "오늘 하루 운동시간을 기록해보세요."
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    private lazy var hoursTimerTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.keyboardType = .numberPad
    }
    
    private let minutesTimerTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.keyboardType = .numberPad
    }
    
    private let colonLabel = UILabel().then {
        $0.text = ":"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
        $0.textColor = .gray
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
            $0.top.equalTo(hoursTimerTextField.snp.top).offset(-2)
            $0.height.equalTo(hoursTimerTextField.snp.height)
            $0.width.equalTo(17)
        }
        
        hoursTimerTextField.snp.makeConstraints {
            $0.top.equalTo(colonLabel.snp.top)
            $0.leading.equalToSuperview().inset(68)
        }
        
        minutesTimerTextField.snp.makeConstraints {
            $0.top.equalTo(hoursTimerTextField.snp.top)
            $0.trailing.equalToSuperview().inset(65)
        }
        
        okayBtn.snp.makeConstraints {
            $0.top.equalTo(hoursTimerTextField.snp.bottom).offset(84)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

extension ExerciseRecordVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard textField == hoursTimerTextField else {
            if Int(minutesTimerTextField.text ?? "") ?? 0 > 60 {
                minutesTimerTextField.text = "60"
            }
            return
        }
        if Int(hoursTimerTextField.text ?? "") ?? 0 > 24 {
            hoursTimerTextField.text = "12"
        }
        
        guard textField.text?.count ?? 0 >= 2 else {
            print("2개 이상이 아님")
            return
        }
        textField.resignFirstResponder()
        print("2개 이상")
    }
}