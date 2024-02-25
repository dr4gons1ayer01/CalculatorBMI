//
//  ResultView.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class ResultView: UIView {
    let resultLabel = UILabel()
    let scoreLabel = UILabel()
    let recommendationLabel = UILabel()
    let recalculateButton = UIButton(title: "пересчитать", bg: UIColor(white: 1, alpha: 0.8))
    let backColor = UIImageView(image: UIImage(named: "resultBottom")!)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundColor = UIColor(named: "resultBg")
        
        recalculateButton.setTitleColor(UIColor(named: "buttonColor"), for: .normal)
        backColor.contentMode = .scaleAspectFill
        
        resultLabel.text = "ТВОЙ РЕЗУЛЬТАТ"
        resultLabel.font = UIFont(name: "Gilroy-Bold", size: 36)
        resultLabel.textColor = .white
        
        scoreLabel.text = "19.5"
        scoreLabel.font = UIFont(name: "Gilroy-Bold", size: 62)
        scoreLabel.textColor = .white
        
        recommendationLabel.text = "ешь больше мяса!"
        recommendationLabel.font = UIFont(name: "Gilroy-Regular", size: 24)
        recommendationLabel.textColor = .white
        
        let stack = UIStackView(arrangedSubviews: [resultLabel, scoreLabel, recommendationLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10

        addSubview(stack)
        addSubview(recalculateButton)
        addSubview(backColor)
        bringSubviewToFront(recalculateButton)

        stack.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        backColor.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
           
            recalculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            backColor.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            backColor.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct ResultViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = ResultView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
