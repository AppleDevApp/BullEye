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
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        //其实是在剪裁图片
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let traceRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(traceRightResizable, for: .normal)
        
        startNewGame()
    }
    
    func startNewRecord() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
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

    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRecord()
    }
    
}

