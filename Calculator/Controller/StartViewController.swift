//
//  StartViewController.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class StartViewController: UIViewController {
    let mainView = StartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        updateUI()
        
    }
    func updateUI() {
        calculate()
        
    }
    
    func calculate() {
        let tap = UIAction { _ in
//            let vc = ResultViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            
            let height = self.mainView.heightSlider.value
            let weight = self.mainView.weightSlider.value
            let bmi = weight / (height * height)
            print(bmi)
            

        }
        mainView.calculateButton.addAction(tap, for: .touchUpInside)
    }
}


