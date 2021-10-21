//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Castro, Brais on 21/10/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format:"%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBackgroundColor() -> UIColor {
        return bmi?.color ?? UIColor.darkGray
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemBlue)
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemGreen)
        default:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.systemRed)
        }
    }
}
