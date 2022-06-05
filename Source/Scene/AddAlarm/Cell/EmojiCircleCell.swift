//
//  EmojiCircleCell.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/05.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit
import Then

class EmojiCricleCell: UIView {
    
    private lazy var emojiCircle = UIView().then {
        $0.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.layer.bounds.width/2
    }
    
    private lazy var emojiLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 28)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(emojiCircle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(placeholder: String) {
        emojiCircle.backgroundColor = .orange
        self.accessibilityAttributedLabel = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
    }
}
