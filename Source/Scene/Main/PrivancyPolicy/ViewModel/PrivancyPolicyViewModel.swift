//
//  PrivancyPolicyViewModel.swift
//  HealthManager
//
//  Created by 민도현 on 2022/09/22.
//  Copyright © 2022 com.tm. All rights reserved.
//

import Foundation

class PrivancyPolicyViewModel: BaseViewModel {
    func readTxtFile() {
        var result = ""
        
        let path = Bundle.main.path(forResource: "PrivancyPolicy.txt", ofType: nil)
        guard path != nil else { return }
        
        do {
            result = try String(contentsOfFile: path!, encoding: .utf8)
        } catch (let error as NSError) {
            return print(error.localizedDescription)
        }
        
        print("result = \(result)")
    }
}
