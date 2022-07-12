//
//  Coordinator.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/23.
//  Copyright © 2022 com.tm. All rights reserved.
//
import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
    func pushLoginVC()
    func pushSignUpVC()
    func pushMainCalendarVC()
    func pushProfileVC()
}
