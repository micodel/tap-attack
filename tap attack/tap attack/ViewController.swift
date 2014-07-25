//
//  ViewController.swift
//  tap attack
//
//  Created by Michael Hamel on 7/23/14.
//  Copyright (c) 2014 Michael Hamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // GLOBAL VARIABLES
    // ----------------
    
    // Variables connected to labels and buttons on main view.
    @IBOutlet var timeLabel:UILabel
    @IBOutlet var scoreLabel:UILabel
    @IBOutlet var tapButton:UIButton
    
    // Variables to contain score and time per round.
    var currentScore = Int()
    var currentTime = Int()
    
    // Initializes game timer.
    var gameTimer = NSTimer()
    
    
    // SYSTEM
    // ------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // FUNCTIONS
    // ---------
    
    // Function to (re)set variables and start the game.
    func startGame() {
        
        currentScore = 0
        currentTime = 5
        
        scoreLabel.text = "Score: \(currentScore)"
        timeLabel.text = "Time Remaining: \(currentTime)"
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("runTimer"), userInfo: nil, repeats: true)
    }

    
    // Function to increase score by 1 (per button click).
    @IBAction func updateScore() {
        ++currentScore
        // Refreshes scoreLabel text to reflect new score.
        scoreLabel.text = "Score: \(currentScore)"
    }
    
    // Function to count down timer until it reaches 0.
    func runTimer() {
        --currentTime
        timeLabel.text = "Time Remaining: \(currentTime)"
        
        if (currentTime == 0){
            
            gameTimer.invalidate()
        }
    }



}

