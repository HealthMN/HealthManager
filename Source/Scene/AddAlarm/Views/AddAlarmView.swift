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
    
    private let titleViewLabel = UILabel().then {
        $0.text = "알람 추가"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
    private lazy var cancelBtn = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.addTarget(self, action: #selector(clickCancelBtn(_:)), for: .touchUpInside)
    }
    
    private let okayBtn = UIButton().then() {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
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
    
    private let repeatDayQuestionLabel = UILabel().then {
        $0.text = "반복할 요일을 선택해주세요!"
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let repeatDaytableView = UITableView().then {
        $0.register(AddAlarmViewCell.self, forCellReuseIdentifier: "AddAlarmViewCell")
        $0.rowHeight = UITableView.automaticDimension
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
    
    @objc func clickCancelBtn(_ sender: UIButton) {
        print("dismiss")
        self.dismiss(animated: true)
    }
    
    override func addView() {
        view.addSubviews(titleViewLabel, cancelBtn, okayBtn,  datepickerView, clockEmoji, runEmoji, foodEmoji, pillEmoji,muscleEmoji, descriptionLabel, descriptionTextField, repeatDayQuestionLabel, repeatDaytableView)
    }
    
    override func configureVC() {
        repeatDaytableView.delegate = self
        repeatDaytableView.dataSource = self
        
        navigationItem.titleView = titleViewLabel
    }
    
    override func setLayout() {
        titleViewLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }

        cancelBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
        }

        okayBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        datepickerView.snp.makeConstraints {
            $0.top.equalTo(titleViewLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(190)
        }
        
        clockEmoji.snp.makeConstraints {
            $0.size.equalTo(55)
            $0.top.equalTo(datepickerView.snp.bottom).offset(27)
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
            $0.top.equalTo(clockEmoji.snp.bottom).offset(27)
        }
        
        descriptionTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
        }
        
        repeatDayQuestionLabel.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.top.equalTo(descriptionTextField.snp.bottom).offset(24)
        }
        
        repeatDaytableView.snp.makeConstraints {
            $0.top.equalTo(repeatDayQuestionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(28)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            cell.tintColor = HealthManagerAsset.hmPrimary.color
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
