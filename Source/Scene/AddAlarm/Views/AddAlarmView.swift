//
//  AddAlarmView.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/03.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import Then
import SnapKit

class AddAlarmView: BaseVC {
    private let datepickerView = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
    }
    
    private let selectIcon = UILabel().then {
        $0.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.layer.bounds.width/2 - 4
//        $0.backgroundColor = .init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        $0.backgroundColor = .orange
    }
    
    override func addView() {
        view.addSubviews(datepickerView, selectIcon)
    }
    
    override func setLayout() {
        datepickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
        
        selectIcon.snp.makeConstraints {
            $0.size.equalTo(60)
            $0.top.equalTo(datepickerView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(15)
        }
    }
}
