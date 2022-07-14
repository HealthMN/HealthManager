//
//  ProfileGraphVC.swift
//  HealthManager
//
//  Created by 민도현 on 2022/07/13.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import Charts
import Then
import RealmSwift
import SnapKit
import UIKit

class ProfileGraphVC: BaseVC {
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cells = ["운동시간 보기", "탈퇴하기", "설정", "회원 탈퇴"]
    
    private let lineChartView = LineChartView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.xAxis.labelTextColor = .clear
        $0.rightAxis.enabled = false
        $0.leftAxis.labelTextColor = HealthManagerAsset.hmPrimary.color
        $0.xAxis.setLabelCount(7, force: false)
        $0.animate(xAxisDuration: 2)
        $0.xAxis.drawGridLinesEnabled = false
        $0.leftAxis.drawGridLinesEnabled = false
        $0.xAxis.labelPosition = .bottom
    }
    
    private let profileTableView = UITableView().then {
        $0.register(ProfileTabelVeiwCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.97, green: 0.98, blue: 0.97, alpha: 1)
        viewModel.readThisWeekData()
        viewModel.coordinator?.presentProfileGraphVC()
    }
    
    override func viewDidLayoutSubviews() {
        let set = LineChartDataSet(entries: viewModel.entries, label: "이번 주")
        let set2 = LineChartDataSet(entries: viewModel.entries2, label: "저번 주")
        
        let data = LineChartData(dataSets: [set, set2])
        //        data.setDrawValues(false)
        
        set.mode = .horizontalBezier
        set.lineWidth = 2.5
        set.setColors(HealthManagerAsset.hmPrimary.color)
        set.circleHoleRadius = 4.0
        set.circleRadius = 4.0
        set.circleColors = [HealthManagerAsset.hmPrimary.color]
        
        set2.mode = .horizontalBezier
        set2.lineWidth = 2.5
        set2.setColors(.gray)
        set2.circleHoleRadius = 4.0
        set2.circleRadius = 4.0
        set2.circleColors = [.gray]
        
        lineChartView.data = data
    }
    
    override func addView() {
        view.addSubviews(lineChartView, profileTableView)
    }
    
    override func setLayout() {
        lineChartView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(104)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(270)
        }
        
        profileTableView.snp.makeConstraints {
            $0.top.equalTo(lineChartView.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(93)
        }
    }
}

extension ProfileGraphVC: UITableViewDelegate {
    
}

extension ProfileGraphVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTabelVeiwCell else { return UITableViewCell()}
        
        cell.titleTextLabel.text = cells[indexPath.row]
        
        return cell
    }
}
