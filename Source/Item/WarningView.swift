//
//  warningView.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/27.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import Then

class WarningView: UIView {
    private let warningLabel = UILabel().then {
        $0.text = "이메일입력"
        $0.textColor = .init(red: 1, green: 0.52, blue: 0.52, alpha: 1)
        $0.backgroundColor = .red
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(warningLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setWarningLabel(text: String) {
        warningLabel.text = text
    }
}
