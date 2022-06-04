//
//  CreateCircle.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/03.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit

class CreateCircle: UILabel {
    private lazy var circle = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circle)
        
        circle.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCircle(emoji: String) {
        self.attributedText = NSAttributedString(
            string: emoji,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        circle.backgroundColor = UIColor(red: 0.25, green: 0.26, blue: 0.58, alpha: 1)
    }
    
}
    
