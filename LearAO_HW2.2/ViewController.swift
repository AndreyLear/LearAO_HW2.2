//
//  ViewController.swift
//  LearAO_HW2.2
//
//  Created by Andrey Lear on 25.08.2020.
//  Copyright © 2020 Andrey Lear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    @IBOutlet weak var substractView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // MARK: - Private properties
    private var redColor: CGFloat = 0
    private var greenColor: CGFloat = 0
    private var blueColor: CGFloat = 0
    
    private let oneTone: Float = 0.00392 // 1 / 255
    
    // MARK: - Live Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliderValues(slider: &redSlider, value: Float.random(in: 0...1))
        setupSliderValues(slider: &greenSlider, value: Float.random(in: 0...1))
        setupSliderValues(slider: &blueSlider, value: Float.random(in: 0...1))
        
        redSlider.minimumTrackTintColor = UIColor(red: 1, green: 0.404, blue: 0.373, alpha: 1)
        greenSlider.minimumTrackTintColor = UIColor(red: 0.196, green: 0.764, blue: 0.528, alpha: 1)
        blueSlider.minimumTrackTintColor = UIColor(red: 0.26, green: 0.601, blue: 1, alpha: 1)

//        redLabel.text = String(format: "%.2f", redSlider.value)
//        greenLabel.text = String(format: "%.2f", greenSlider.value)
//        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        // Normal RGB
        redLabel.text = "\(Int(redSlider.value / oneTone))"
        greenLabel.text = "\(Int(greenSlider.value / oneTone))"
        blueLabel.text = "\(Int(blueSlider.value / oneTone))"
    }
    
    override func viewDidLayoutSubviews() {
        substractView.layer.cornerRadius = 8
        substractView.layer.shadowColor = UIColor.black.cgColor
        substractView.layer.shadowOpacity = 0.15
        substractView.layer.shadowOffset = .init(width: 0, height: 2)
        substractView.layer.shadowRadius = 3
        
        // Setting up a view background
        
        view.backgroundColor = UIColor.init(
            red: changeColor(slider: redSlider, color: &redColor),
            green: changeColor(slider: greenSlider, color: &greenColor),
            blue: changeColor(slider: blueSlider, color: &blueColor),
            alpha: 1)
    }
    
    // MARK: - IB Actions
    @IBAction func changeRedColor() {
//      redLabel.text = String(format: "%.2f", redSlider.value)
        redLabel.text = "\(Int(redSlider.value / oneTone))" // from 0 to 255
    }
    
    @IBAction func changeGreenColor() {
//      greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenLabel.text = "\(Int(greenSlider.value / oneTone))" // from 0 to 255
    }
    
    @IBAction func changeBlueColor() {
//      blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueLabel.text = "\(Int(blueSlider.value / oneTone))" // from 0 to 255
    }
    
    // MARK: - Private Methods
    private func changeColor(slider: UISlider, color: inout CGFloat) -> CGFloat {
        color = CGFloat(slider.value)
        
        return color
    }
    
    private func setupSliderValues(slider: inout UISlider, value: Float) {
        slider.value = value
        slider.minimumValue = 0
        slider.maximumValue = 1
    }
}

