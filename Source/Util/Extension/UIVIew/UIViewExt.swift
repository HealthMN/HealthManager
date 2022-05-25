//
//  UIViewExt.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/25.
//  Copyright © 2022 com.tm. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ subView: UIView...) {
        subView.forEach(addSubview(_:))
    }
}
