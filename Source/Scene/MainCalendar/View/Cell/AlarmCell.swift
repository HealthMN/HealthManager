//
//  AlarmCell.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/30.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class AlarmCell: UITableViewCell {
    
    private let emojiLabel = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.layer.bounds.width/2 - 2
        $0.backgroundColor = .init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    }
    
    private let timeLabel = UILabel().then {
        $0.text = "6시 30분"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .blue
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "헬스가기"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let switchLabel = UISwitch().then {
        $0.onTintColor = HealthManagerAsset.hmPrimary.color
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        contentView.addSubviews(emojiLabel, timeLabel, descriptionLabel, switchLabel)
    }
    
    func setLayout() {
        emojiLabel.snp.makeConstraints {
            $0.size.equalTo(56)
            $0.leading.equalTo(30)
            $0.top.equalTo(14)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(emojiLabel.snp.trailing).offset(18)
            $0.top.equalTo(22)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(timeLabel)
            $0.top.equalTo(timeLabel.snp.bottom).offset(2)
        }
        
        switchLabel.snp.makeConstraints {
            $0.trailing.equalTo(-26)
            $0.top.equalTo(21)
        }
    }
}
