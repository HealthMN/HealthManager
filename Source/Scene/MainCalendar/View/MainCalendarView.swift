//
//  MainCalendarVC.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/30.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Inject

private let calendarViewModel = CalendarViewModel()

class MainCalendarVC: BaseVC {
    
    private let smallTitleLabel = UILabel().then {
        $0.text =  "오늘 운동 일정을 확인하세요!"
        $0.textColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    
    private let todayDateLabel = UILabel().then {
        $0.text = calendarViewModel.getTodayTime()
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
    }
    
    override func addView() {
        view.addSubviews(smallTitleLabel, todayDateLabel)
    }
    
    override func configureVC() {
        print("asdf = \(calendarViewModel.getTodayTime())")
    }
    
    override func setLayout() {
        smallTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(88)
            $0.leading.equalToSuperview().inset(26)
        }
        
        todayDateLabel.snp.makeConstraints {
            $0.top.equalTo(smallTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(smallTitleLabel.snp.leading)
        }
    }
}
