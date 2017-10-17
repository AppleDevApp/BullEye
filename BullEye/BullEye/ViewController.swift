//
//  ViewController.swift
//  BullEye
//
//  Created by AppleDevApp on 17/10/17.
//  Copyright © 2017年 AppleDevApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0 {
        didSet {
            updateLables()
        }
    }
    
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRecord()
    }
    
    func startNewRecord() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        @IBOutlet weak var resetGame: UIButton!
        currentValue = 50
        slider.setValue(Float(currentValue), animated: true)
    }
    
    func updateLables() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        let message = """
        The value of the slider is \(currentValue)
        The target value is \(targetValue)
        Your Score is \(points)
        """
        let alertController = UIAlertController(title: "Alert Windows", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Superprise", style: .default, handler: {(alertAction:UIAlertAction) in
            self.startNewRecord()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("Slider value is \(sender.value)")
        currentValue = lroundf(sender.value)
    }
}

