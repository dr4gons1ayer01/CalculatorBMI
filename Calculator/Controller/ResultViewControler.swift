//
//  ResultViewController.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class ResultViewControler: UIViewController {
    let mainView = ResultView()
    var bmiValue: BMI?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        recalculate()
        updateUI()
        
    }
    func updateUI() {
        mainView.backgroundColor = bmiValue?.color
        mainView.recommendationLabel.text = bmiValue?.advice
        mainView.scoreLabel.text = String(format: "%.1f", bmiValue?.value ?? 0.0)
    }
    
    func recalculate() {
        let tap = UIAction { _ in
            
            self.navigationController?.popViewController(animated: true)
        }
        mainView.recalculateButton.addAction(tap, for: .touchUpInside)
    }
    

}
