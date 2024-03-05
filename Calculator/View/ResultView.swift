//
//  ResultView.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class ResultView: UIView {
    let resultLabel = UILabel(text: "ТВОЙ РЕЗУЛЬТАТ")
    let scoreLabel = UILabel(text: "19.5")
    let recommendationLabel = UILabel(text: "ешь больше мяса!")
    let recalculateButton = UIButton(title: "пересчитать", bg: UIColor(white: 1, alpha: 0.8))
    let bottomColor = UIImageView(image: UIImage(named: "resultBottom")!)
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundColor = UIColor(named: "resultBg")
        
        recalculateButton.setTitleColor(UIColor(named: "buttonColor"), for: .normal)

        resultLabel.font = UIFont(name: "Gilroy-Bold", size: 36)
        resultLabel.textColor = .white
        
        scoreLabel.font = UIFont(name: "Gilroy-Bold", size: 62)
        scoreLabel.textColor = .white
        
        recommendationLabel.font = UIFont(name: "Gilroy-Regular", size: 24)
        recommendationLabel.textColor = .white
        
        let stack = UIStackView(arrangedSubviews: [resultLabel, 
                                                   scoreLabel,
                                                   recommendationLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10

        addSubview(stack)
        addSubview(recalculateButton)
        addSubview(bottomColor)
        bringSubviewToFront(recalculateButton)

        stack.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        bottomColor.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
           
            recalculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            bottomColor.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            bottomColor.bottomAnchor.constraint(equalTo: bottomAnchor),
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
