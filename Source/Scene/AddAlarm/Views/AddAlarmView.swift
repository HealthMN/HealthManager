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
    
    private let clockEmoji = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "⏰")
    }
    
    private let runEmoji = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "👟")
    }
    
    private let foodEmoji = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "🍖")
    }
    
    private let pillEmoji = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "💊")
    }
    
    private lazy var muscleEmoji = EmojiCricleCell().then {
        $0.setPlaceholder(placeholder: "💪🏻")
        $0.addTarget(self, action: #selector(muscleEmojiClick(_:)), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubviews(datepickerView, clockEmoji, runEmoji, foodEmoji, pillEmoji, muscleEmoji)
    }
    
    @objc func muscleEmojiClick(_ sender: UIButton) {
        print("clcik!!")
    }
    
    override func setLayout() {
        datepickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
        
        clockEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(datepickerView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(20)
        }
        
        runEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(clockEmoji.snp.top)
            $0.leading.equalTo(clockEmoji.snp.trailing).offset(20)
        }
        
        foodEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(clockEmoji.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        pillEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(clockEmoji.snp.top)
            $0.leading.equalTo(foodEmoji.snp.trailing).offset(20)
        }
        
        muscleEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(clockEmoji.snp.top)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
