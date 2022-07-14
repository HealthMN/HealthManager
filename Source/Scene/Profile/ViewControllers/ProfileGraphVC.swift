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

class ProfileGraphVC: BaseVC {
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let lineChartView = LineChartView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.xAxis.labelTextColor = .clear
        $0.rightAxis.enabled = false
        $0.leftAxis.labelTextColor = HealthManagerAsset.hmPrimary.color
        $0.xAxis.setLabelCount(7, force: false)
        $0.animate(xAxisDuration: 2)
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.97, green: 0.98, blue: 0.97, alpha: 1)
        viewModel.readThisWeekData()
        viewModel.coordinator?.presentProfileGraphVC()
    }
    
    override func viewDidLayoutSubviews() {
        let set = LineChartDataSet(entries: viewModel.entries, label: "이번 주")
        let set2 = LineChartDataSet(entries: viewModel.entries2, label: "저번 주")
        
        set.mode = .horizontalBezier
        set.lineWidth = 2
        set.setColors(HealthManagerAsset.hmPrimary.color)
        set.circleHoleRadius = 3.0
        set.circleRadius = 3.0
        set.circleColors = [HealthManagerAsset.hmPrimary.color]
        
        set2.mode = .horizontalBezier
        set2.lineWidth = 2
        set2.setColors(.gray)
        set2.circleHoleRadius = 3.0
        set2.circleRadius = 3.0
        set2.circleColors = [.gray]
        
        let data = LineChartData(dataSets: [set, set2])
        
        
        lineChartView.data = data
    }
    
    override func addView() {
        view.addSubviews(lineChartView)
    }
    
    override func setLayout() {
        lineChartView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(104)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(270)
        }
    }
}
