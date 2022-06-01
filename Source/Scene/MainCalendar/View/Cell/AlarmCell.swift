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
    
    private let switchLabel = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .orange
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        contentView.addSubviews(emojiLabel, switchLabel)
    }
    
    func setLayout() {
        emojiLabel.snp.makeConstraints {
            $0.size.equalTo(56)
            $0.leading.equalTo(30)
            $0.top.equalTo(14)
        }
        
        switchLabel.snp.makeConstraints {
            $0.trailing.equalTo(-26)
            $0.top.equalTo(21)
        }
    }
}
