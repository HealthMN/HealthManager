//
//  UIViewExt.swift
//  HealthManager
//
//  Created by 민도현 on 2022/05/25.
//  Copyright © 2022 com.tm. All rights reserved.
//

import UIKit
import SwiftUI

extension UIView {
    func addSubviews(_ subView: UIView...) {
        subView.forEach(addSubview(_:))
    }
}

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        print("화면 배율: \(UIScreen.main.scale)")// 배수
        print("origin: \(self), resize: \(renderImage)")
        
        return renderImage
    }
}

extension UITextField { // textField 흔들기
    func shake() {
        UIView.animate(withDuration: 0.6, animations: {
            
            for _ in self.subviews {
                self.subviews[0].backgroundColor = .red
            }
        })
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        print("subview = \(self.subviews.count)")
        
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension UISwitch {
    
    func setSwitch(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51
        
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth
        
        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
