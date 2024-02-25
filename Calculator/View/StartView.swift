//
//  StartView.swift
//  Calculator
//
//  Created by Иван Семенов on 23.02.2024.
//

import UIKit

class StartView: UIView {
    let backgroundImage = UIImageView(image: UIImage(named: "bg")!)
    let calculateLabel = UILabel()
    
    let heightInfoLabel = UILabel()
    let heightLabel = UILabel()
    let heightSlider = UISlider()
    
    let weightInfoLabel = UILabel()
    let weightLabel = UILabel()
    let weightSlider = UISlider()
    let calculateButton = UIButton(title: "посчитать", bg: UIColor(named: "buttonColor")!)
    
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    func setupUI() {
        backgroundImage.contentMode = .scaleAspectFill
        calculateLabel.text = "РАССЧЕТ ИНДЕКСА \nМАССЫ ТЕЛА"
        
        calculateLabel.numberOfLines = 3
        calculateLabel.font = UIFont(name: "Gilroy-Bold", size: 40)
        calculateLabel.textColor = .black
        
        heightInfoLabel.text = "Рост"
        heightLabel.text = "1.5 м"
        
        weightInfoLabel.text = "Вес"
        weightLabel.text = "100 кг"
        
        heightSlider.tintColor = UIColor(named: "buttonColor")
        weightSlider.tintColor = UIColor(named: "buttonColor")
        
        heightSlider.minimumValue = 0.5
        heightSlider.maximumValue = 2.5
        
        weightSlider.minimumValue = 30.0
        weightSlider.maximumValue = 200.0
        
        heightSlider.addTarget(self, action: #selector(heightSliderValueChanged(_:)), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderValueChanged(_:)), for: .valueChanged)
        heightSlider.value = (heightSlider.maximumValue - heightSlider.minimumValue) / 1.6
        weightSlider.value = (weightSlider.maximumValue - weightSlider.minimumValue) / 1.4

    
        let heightStack = UIStackView(arrangedSubviews: [heightInfoLabel,heightLabel])
        heightStack.axis = .horizontal
        heightStack.spacing = 100
        
        let weightStack = UIStackView(arrangedSubviews: [weightInfoLabel,weightLabel])
        weightStack.axis = .horizontal
        weightStack.spacing = 100
        weightLabel.textAlignment = .right

        let stack = UIStackView(arrangedSubviews: [heightStack, heightSlider, weightStack, weightSlider, calculateButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        addSubview(backgroundImage)
        addSubview(calculateLabel)
        addSubview(stack)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        calculateLabel.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            calculateLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            calculateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    @objc func heightSliderValueChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) м"
//        print("Новое значение: \(String(format: "%.2f м", sender.value))")
    }
    @objc func weightSliderValueChanged(_ sender: UISlider) {
        let weight = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weight) кг"
//        print("Новое значение: \(String(format: "%.2f м", sender.value))")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIButton {
    convenience init(title: String, bg: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 25)
        backgroundColor = bg
        layer.cornerRadius = 12
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

import SwiftUI

struct StartViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = StartView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
