//
//  StartViewController.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class StartViewController: UIViewController {
    let mainView = StartView()
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        calculate()
    }
    
    func calculate() {
        let tap = UIAction { _ in
            
            let weight = self.mainView.weightSlider.value
            let height = self.mainView.heightSlider.value
            
            self.calculatorBrain.calculateBMI(height: height, weight: weight)
            
            let vc = ResultViewControler()
            vc.bmiValue = self.calculatorBrain.bmi
            self.navigationController?.pushViewController(vc, animated: true)
        }
        mainView.calculateButton.addAction(tap, for: .touchUpInside)
    }

}


