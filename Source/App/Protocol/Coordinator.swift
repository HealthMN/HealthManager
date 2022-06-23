//
//  Coordinator.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/22.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    
    func start()
    func pushMainCalendarVC()
}
