//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Mobil Trakya on 06/03/2018.
//  Copyright © 2018 Mobil Trakya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 1
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var totalRound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        if (difference == 0){
            title = "Perfect!"
            points += 100
        } else if (difference < 5){
            title = "You almost had it!"
            points += 50
        } else if (difference < 10){
            title = "Pretty good."
        } else {
            title = "Not even close..."
        }
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.startNewRound()
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
        updateLabels()
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 1
        slider.value = Float(currentValue)
        round += 1
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels(){
        label.text = String(targetValue)
        totalScore.text = String(score)
        totalRound.text = String(round)
    }
    
}

