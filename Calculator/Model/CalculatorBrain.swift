//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Иван Семенов on 04.03.2024.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 19.5 {
            bmi = BMI(value: bmiValue, advice: "Кушай больше мяса", color: .systemBlue)
        } else if bmiValue <= 24.5 {
            bmi = BMI(value: bmiValue, advice: "Все в порядке", color: .systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Пора бы похудеть", color: .systemRed)
        }
    }
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
}

