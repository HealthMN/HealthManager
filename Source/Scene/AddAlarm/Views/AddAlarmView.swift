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
import SwiftUI

class AddAlarmView: BaseVC {
    private let cells: [UITableViewCell] = ["반복 없음","일요일마다","월요일마다", "화요일마다", "수요일마다", "목요일마다", "금요일마다","토요일마다"] as! [UITableViewCell]
    
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
    
    private let descriptionLabel = UILabel().then {
        $0.text = "내용"
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let descriptionTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "내용을 입력해주세요.")
    }
    
    private let repeatDayQuestion = UILabel().then {
        $0.text = "반복할 요일을 선택해주세요!"
        $0.font = .systemFont(ofSize: 15)
    }
    
    override func addView() {
        view.addSubviews(datepickerView, clockEmoji, runEmoji, foodEmoji, pillEmoji,
                         muscleEmoji, descriptionLabel, descriptionTextField, repeatDayQuestion)
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
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(31)
            $0.top.equalTo(clockEmoji.snp.bottom).offset(32)
        }
        
        descriptionTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
        }
        
        repeatDayQuestion.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.top.equalTo(descriptionTextField.snp.bottom).offset(35)
        }
        
        
    }
}

extension AddAlarmView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        return cell
    }
    
    
}
