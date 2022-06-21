//
//  MainCalendarVC.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/30.
//  Copyright © 2022 com.tm. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Inject
import FSCalendar

class MainCalendarVC: BaseVC {
    private let calendarViewModel = CalendarViewModel()
    
    private let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let contentScrollView = UIScrollView()
    
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
        $0.appearance.headerDateFormat = "MMMM"
        $0.appearance.headerTitleColor = HealthManagerAsset.hmPrimary.color
        $0.appearance.titleWeekendColor = .red
        $0.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        $0.appearance.weekdayTextColor = .black
    }
    
    private lazy var addBtn = UIButton().then {
        $0.setTitle("+ 알림 추가하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(addAlarmBtnClick(_:)), for: .touchUpInside)
    }
    
    private let alarmTableView = UITableView().then {
        $0.register(AlarmCell.self, forCellReuseIdentifier: "AlarmCell")
        $0.rowHeight = 80
    }
    
    //뷰가 나타나기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.alarmTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }

    //화면에 나타난 직후
    override func viewWillDisappear(_ animated: Bool) {
        self.alarmTableView.removeObserver(self, forKeyPath: "contentSize")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if object is UITableView {
                if let newValue = change?[.newKey] as? CGSize {
                    alarmTableView.snp.updateConstraints {
                        $0.height.equalTo(newValue.height + 50)
                    }
                }
            }
        }
    }
    
    @objc func addAlarmBtnClick(_ sender: UIButton) {
        navigationController?.present(AddAlarmVC(), animated: true)
    }

    override func addView() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubviews(smallTitleLabel, todayDateLabel, profileBtn, fsCalendar, addBtn, alarmTableView)
    }
    
    override func configureVC() {
        todayDateLabel.text = calendarViewModel.getTodayTime()
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
    }
    
    override func setLayout() {
        contentScrollView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.centerX.width.top.bottom.equalToSuperview()
        }
        
        smallTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
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
            $0.top.equalTo(todayDateLabel.snp.bottom).offset(-6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(278)
        }
        
        addBtn.snp.makeConstraints {
            $0.top.equalTo(fsCalendar.snp.bottom).offset(13)
            $0.trailing.equalTo(alarmTableView.snp.trailing)
        }
        
        alarmTableView.snp.makeConstraints {
            $0.top.equalTo(addBtn.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().inset(3)
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension MainCalendarVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension MainCalendarVC: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrolled..")
    }
}
