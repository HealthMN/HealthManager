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
        $0.animate(xAxisDuration: 2)
    }
    
    override func configureVC() {
        view.backgroundColor = .init(red: 0.97, green: 0.98, blue: 0.97, alpha: 1)
        viewModel.coordinator?.presentProfileGraphVC()
    }
    
    override func viewDidLayoutSubviews() {
        viewModel.readData()
        let set = LineChartDataSet(entries: viewModel.entries, label: "오늘의 운동시간")
        let data = LineChartData(dataSet: set)
        
        set.mode = .horizontalBezier
        set.lineWidth = 2
        set.setColors(HealthManagerAsset.hmPrimary.color)
        
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
