//
//  ResultViewController.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class ResultViewController: UIViewController {
    let mainView = ResultView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }


}
