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
    }
    
    override func addView() {
        view.addSubviews(datepickerView)
    }
    
    override func setLayout() {
        datepickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(400)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
    }
}
