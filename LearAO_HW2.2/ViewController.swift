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
    private let oneTone: Float = 0.00392 // 1 / 255
    
    // MARK: - Live Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliderValues(slider: &redSlider)
        setupSliderValues(slider: &greenSlider)
        setupSliderValues(slider: &blueSlider)
        
        redSlider.minimumTrackTintColor = UIColor(red: 1, green: 0.404, blue: 0.373, alpha: 1)
        greenSlider.minimumTrackTintColor = UIColor(red: 0.196, green: 0.764, blue: 0.528, alpha: 1)
        blueSlider.minimumTrackTintColor = UIColor(red: 0.26, green: 0.601, blue: 1, alpha: 1)
        
        // Normal RGB
        redLabel.text = "\(Int(redSlider.value / oneTone))"
        greenLabel.text = "\(Int(greenSlider.value / oneTone))"
        blueLabel.text = "\(Int(blueSlider.value / oneTone))"
        
        substractView.layer.cornerRadius = 8
        substractView.layer.shadowColor = UIColor.black.cgColor
        substractView.layer.shadowOpacity = 0.15
        substractView.layer.shadowOffset = .init(width: 0, height: 2)
        substractView.layer.shadowRadius = 3
        
        // Setting up a view background
        
        setupViewBackgroundColor()
    }
    
    // MARK: - IB Actions
    @IBAction func setColor(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLabel.text = convertSliderValueToRGB(for: redSlider)
        case greenSlider:
            greenLabel.text = convertSliderValueToRGB(for: greenSlider)
        case blueSlider:
            blueLabel.text = convertSliderValueToRGB(for: blueSlider)
        default:
            break
        }
        
        setupViewBackgroundColor()
    }
    
    // MARK: - Private Methods
    private func setupSliderValues(slider: inout UISlider) {
        slider.value = Float.random(in: 0...1)
        slider.minimumValue = 0
        slider.maximumValue = 1
    }
    
    private func setupViewBackgroundColor() {
        view.backgroundColor = UIColor.init(
            red: CGFloat(CGFloat(redSlider.value)),
            green: CGFloat(CGFloat(greenSlider.value)),
            blue: CGFloat(CGFloat(blueSlider.value)),
            alpha: 1
        )
    }
    
    private func convertSliderValueToRGB(for slider: UISlider) -> String {
        "\(Int(slider.value / oneTone))"
    }
}

