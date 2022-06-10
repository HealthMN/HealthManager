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
    
    private let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let contentScrollView = UIScrollView()
    
    private let cells = ["반복 없음","일요일마다","월요일마다", "화요일마다", "수요일마다", "목요일마다", "금요일마다","토요일마다"]
    
    private let datepickerView = UIDatePicker().then {
        $0.datePickerMode = .time
        $0.preferredDatePickerStyle = .wheels
        $0.addTarget(self, action: #selector(changedTimer(_:)), for: .valueChanged)
    }
    
    private let clockEmoji = EmojiCircle().then {
        $0.setPlaceholder(placeholder: "⏰")
    }
    
    private let runEmoji = EmojiCircle().then {
        $0.setPlaceholder(placeholder: "👟")
    }
    
    private let foodEmoji = EmojiCircle().then {
        $0.setPlaceholder(placeholder: "🍖")
    }
    
    private let pillEmoji = EmojiCircle().then {
        $0.setPlaceholder(placeholder: "💊")
    }
    
    private lazy var muscleEmoji = EmojiCircle().then {
        $0.setPlaceholder(placeholder: "💪🏻")
        $0.addTarget(self, action: #selector(clickMuscle(_:)), for: .touchUpInside)
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
    
    private let repeatDaytableView = UITableView().then {
        $0.register(AddAlarmViewCell.self, forCellReuseIdentifier: "AddAlarmViewCell")
        $0.rowHeight = 45
        $0.layer.cornerRadius = 10
    }
    
    @objc func clickMuscle(_ sender: UIButton) {
        print("asdf")
    }
    
    @objc func changedTimer(_ sender: Any?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        print(dateFormatter.string(from: datepickerView.date))
    }
    
    override func addView() {
        
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubviews(datepickerView, clockEmoji, runEmoji, foodEmoji, pillEmoji,muscleEmoji, descriptionLabel, descriptionTextField, repeatDayQuestion, repeatDaytableView)
    }
    
    override func configureVC() {
        repeatDaytableView.delegate = self
        repeatDaytableView.dataSource = self
        
        navigationController?.navigationItem.title = "asdf"
    }
    
    override func setLayout() {
        contentScrollView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.centerX.width.top.bottom.equalToSuperview()
        }
        
        datepickerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
        
        clockEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(datepickerView.snp.bottom).offset(32)
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
            $0.leading.equalToSuperview().inset(32)
            $0.top.equalTo(clockEmoji.snp.bottom).offset(32)
        }
        
        descriptionTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
        }
        
        repeatDayQuestion.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.top.equalTo(descriptionTextField.snp.bottom).offset(45)
        }
        
        repeatDaytableView.snp.makeConstraints {
            $0.top.equalTo(repeatDayQuestion.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(28)
            $0.height.equalTo(300)
        }
    }
}

extension AddAlarmView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlarmViewCell", for: indexPath) as? AddAlarmViewCell else { return UITableViewCell()}
        
        cell.backgroundColor = .init(red: 0.95, green: 0.96, blue: 1, alpha: 1)
        cell.dayLabel.text = cells[indexPath.row]
        return cell
    }
}
