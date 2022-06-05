//
//  EmojiCircleCell.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/05.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class EmojiCricleCell: UIButton {
    
    private let emojiCircle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.layer.bounds.width/2
    }
    
    private let emojiLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 28)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(emojiCircle, emojiLabel)
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(12)
            $0.leading.equalTo(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(placeholder: String) {
        emojiCircle.backgroundColor = .init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        emojiLabel.text = placeholder
    }
}
