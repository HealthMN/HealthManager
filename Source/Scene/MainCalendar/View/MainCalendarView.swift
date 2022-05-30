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
import FSCalendar


class MainCalendarVC: BaseVC {
    private let calendarViewModel = CalendarViewModel()
    
    private let smallTitleLabel = UILabel().then {
        $0.text =  "오늘 운동 일정을 확인하세요!"
        $0.textColor = HealthManagerAsset.hmPrimary.color
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    
    private let todayDateLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 23)
    }
    
    private let profileBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "person.crop.circle")?.resize(newWidth: 37)
            .withTintColor(HealthManagerAsset.hmPrimary.color), for: .normal)
    }
    
    private var fsCalendar = FSCalendar().then {
        $0.locale = Locale(identifier: "En")
        $0.scrollDirection = .vertical
        $0.appearance.headerTitleColor = .clear
        $0.appearance.titleWeekendColor = .red
        $0.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
    }
    
    override func addView() {
        view.addSubviews(smallTitleLabel, todayDateLabel, profileBtn, fsCalendar)
    }
    
    override func configureVC() {
        todayDateLabel.text = calendarViewModel.getTodayTime()
    }
    
    override func setLayout() {
        smallTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().inset(26)
        }
        
        todayDateLabel.snp.makeConstraints {
            $0.top.equalTo(smallTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(smallTitleLabel.snp.leading)
        }
        
        profileBtn.snp.makeConstraints {
            $0.top.equalTo(smallTitleLabel.snp.top)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        fsCalendar.snp.makeConstraints {
            $0.top.equalTo(todayDateLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(350)
        }
    }
}

//extension MainCalendarVC: FSCalendarDelegate, FSCalendarDataSource {
//
//}
