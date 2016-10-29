//
//  ViewController.swift
//  EagleEye
//
//  Created by Dhiviya Dhanasekar on 10/29/16.
//  Copyright © 2016 Dhiviya Dhanasekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 0
    var targetValue : Int = 0
    //@IBOutlet similar to @IBAction. @IBOutlet links vars to UI. @IBAction links the func to the UI
    @IBOutlet weak var slider: UISlider!
    
    func startNewRound(){
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        currentValue = lroundf(slider.value)
//        targetValue = 1 + Int(arc4random_uniform(100))
        
        startNewRound()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(){
        let message = "The value of the slider is \(currentValue)\n" + "The target value is \(targetValue)"
        let alert = UIAlertController(title: "Hi There!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
//        print("The value of the slider is now: \(slider.value)")
        
    }
    
    

}

