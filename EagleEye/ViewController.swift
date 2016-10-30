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
    var score : Int = 0
    var round : Int = 0
    //@IBOutlet similar to @IBAction. @IBOutlet links vars to UI. @IBAction links the func to the UI
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    func startNewRound(){
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        updateLabels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        currentValue = lroundf(slider.value)
//        targetValue = 1 + Int(arc4random_uniform(100))
        
        startNewRound()
        updateLabels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startOver(){
        startNewGame()
    }

    @IBAction func showAction(){
        
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            
            title = "You got the eagle's eyes!"
            points += 100
            
        } else if difference < 5 {
            
            title = "You almost had it!"
            points += 50
            
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not so good.... but try again."
        }
        
        score += points
        let message = "You score points \(points)"
        
//        let message = "The value of the slider is \(currentValue)\n" +
//                            "The target value is \(targetValue)\n" +
//                            "You score points \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        updateLabels()
//        print("The value of the slider is now: \(slider.value)")
        
    }
    
    

}

