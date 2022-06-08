//
//  AddAlarmViewCell.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/08.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AddAlarmViewCell: UITableViewCell {
    
    private let dayLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
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
        contentView.addSubview(dayLabel)
    }
    
    func setLayout() {
        dayLabel.snp.makeConstraints {
            $0.top.equalTo(7)
            $0.leading.equalTo(5)
        }
    }
}
