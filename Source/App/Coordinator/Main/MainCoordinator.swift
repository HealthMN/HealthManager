//
//  LoginCoordinator.swift
//  HealthManager
//
//  Created by 민도현 on 2022/06/22.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var nav: UINavigationController
    
    init(nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let vc = LoginVC(viewModel: .init())
        vc.coordinator = self
        nav.pushViewController(vc, animated: true)
    }
    
    func pushMainCalendarVC() {
        let vc = MainCalendarVC()
        vc.coordinator = self
        nav.setViewControllers([vc], animated: true)
    }
    
    func pushSignUpVC() {
        let vc = SignUpVC(viewModel: .init())
        nav.pushViewController(vc, animated: true)
    }
}
