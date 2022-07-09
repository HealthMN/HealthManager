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
        $0.placeholder = "00:00"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 60)
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    }
    
    override func addView() {
        view.addSubview(contextView)
        contextView.addSubviews(titleLabel, timerTextField)
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
    }
}
