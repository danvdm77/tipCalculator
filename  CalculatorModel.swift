//
//   CalculatorModel.swift
//  tipCalculator
//
//  Created by etudiant02 on 06/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import Foundation

struct CalculatorModel {
    var checkAmount = 0.0
    
    var serviceLevel = 0
    
    let tipRates = [0.1, 0.15, 0.2]
    
    let tipLabels = ["Fair", "Good", "Excellent"]
    
    var computedTip: Double {
        return checkAmount * tipRates[serviceLevel]
    }
    
    var serviceLabelText:String {
        return tipLabels[serviceLevel]
    }
}
