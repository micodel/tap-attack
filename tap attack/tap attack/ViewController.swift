//
//  ViewController.swift
//  tap attack
//
//  Created by Michael Hamel on 7/23/14.
//  Copyright (c) 2014 Michael Hamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables connected to labels and buttons on main view.
    @IBOutlet var timeLabel:UILabel
    @IBOutlet var scoreLabel:UILabel
    @IBOutlet var tapButton:UIButton
    
    // Variables to contain score and time per round.
    var currentScore = Int()
    var currentTime = Int()
    
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // Function to increase score by 1 (per button click).
    @IBAction func updateScore() {
        ++currentScore
        // Refreshes scoreLabel text to reflect new score.
        scoreLabel.text = "Score: \(currentScore)"
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

