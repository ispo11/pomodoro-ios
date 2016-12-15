//
//  ViewController.swift
//  SwiftTimerTutorial
//
//  Created by Issavara Polanun on 12/14/16.
//  Copyright © 2016 Issavara Polanun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countingLabel: UILabel!
    @IBOutlet weak var roundedButton: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
        SwiftTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)

    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        SwiftTimer.invalidate()
    }
    
    //magic button starts,stops timer
    @IBAction func pressRoundedButton(sender: AnyObject) {
        if SwiftCounter == 0 {
            SwiftCounter = 10
        }
        
        if (roundedButton.currentTitle == "Start"){ //if timer hasn't started
            startTimer()
        }
            
        else{ //if timer is started
        //stop timer
            stopTimer()
        }
        
    }
    
    
    @IBAction func clearButton(sender: AnyObject) {
        SwiftTimer.invalidate() //stop NSTIMER() from firing
        SwiftCounter = 0 //Reset SwiftCounter
        countingLabel.text = String(SwiftCounter) //Clear counting label on the view
        roundedButton.setTitle("Start", forState: .Normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countingLabel.text = String(SwiftCounter)
        roundedButton.layer.cornerRadius = 4
        roundedButton.backgroundColor = UIColor(red: 0, green: 255.0, blue: 0, alpha: 0.64)


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var SwiftTimer = NSTimer()
    

    
    var SwiftCounter = 10
    
    func updateCounter() {
        if SwiftCounter == 0 {
            countingLabel.text = "Done"
            stopTimer()
        } else {
        countingLabel.text = String(SwiftCounter--)
        }
    }
    
    func startTimer() {
        SwiftTimer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        
        //change button to say pause
        roundedButton.setTitle("Pause", forState: .Normal)
        
        //change button color to red
        roundedButton.backgroundColor = UIColor(red: 255.0, green: 0, blue: 0, alpha: 0.67)
    }
    
    func stopTimer() {
        //stop timer
        SwiftTimer.invalidate()
        
        //change button to say Start
        roundedButton.setTitle("Start", forState: .Normal)
        
        //change button color to green
        roundedButton.backgroundColor = UIColor(red: 0, green: 255.0, blue: 0, alpha: 0.67)
    }
    
    

}

