//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Mobil Trakya on 06/03/2018.
//  Copyright © 2018 Mobil Trakya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let message = "The value of the slider now is: \(currentValue)"
        let alert = UIAlertController(title: "Hello world", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of the slider now is: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}

