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
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: "Score", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 1
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels(){
        label.text = String(targetValue)
        totalScore.text = String(score)
        totalRound.text = String(round)
    }
    
}

