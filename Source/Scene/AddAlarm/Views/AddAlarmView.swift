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
    
    private let selectIcon1 = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "⏰")
    }
    
    private let selectIcon2 = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "👟")
    }
    
    private let selectIcon3 = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "🍖")
    }
    
    private let selectIcon4 = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "💊")
    }
    
    private let selectIcon5 = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "💪🏻")
    }
    
    override func addView() {
        view.addSubviews(datepickerView, selectIcon1, selectIcon2, selectIcon3, selectIcon4, selectIcon5)
    }
    
    override func setLayout() {
        datepickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
        
        selectIcon1.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(datepickerView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(20)
        }
        
        selectIcon2.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(selectIcon1.snp.top)
            $0.leading.equalTo(selectIcon1.snp.trailing).offset(20)
        }
        
        selectIcon3.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(selectIcon1.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        selectIcon4.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(selectIcon1.snp.top)
            $0.leading.equalTo(selectIcon3.snp.trailing).offset(20)
        }
        
        selectIcon5.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(selectIcon1.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
