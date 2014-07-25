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
    
    // Initializes game over view.
    var gameOverView = UIView()
    
    
    // SYSTEM
    // ------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // FUNCTIONS
    // ---------
    
    // Function to (re)set variables and start the game.
    func startGame() {
        
        // Removes game over view from screen if present.
        gameOverView.removeFromSuperview()
        
        // (re)Sets current score to 0 and current time to 5 seconds.
        currentScore = 0
        currentTime = 5
        
        // Defines the text to be shown in current score and time labels.
        scoreLabel.text = "Score: \(currentScore)"
        timeLabel.text = "Time Remaining: \(currentTime)"
        
        // Game timer to execute. Runs timer function every 1 second.
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
        
        // When timer reachers 0, stops timer and renders game over view.
        if (currentTime == 0){
            gameTimer.invalidate()
            renderGameOverView()
        }
    }
    
    // Defines game over view and appends over main view.
    func renderGameOverView() {
        gameOverView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        
        gameOverView.backgroundColor = UIColor.blackColor()
        
        // Lays game over view on top of main view.
        self.view.addSubview(gameOverView)
        
        var gameOverImage = UIImageView(frame: CGRectMake(40, 93, 240, 128))
        // Renders image found in images.xcassets by name.
        gameOverImage.image = UIImage(named: "game-over")
        gameOverView.addSubview(gameOverImage)
        
        // Defines and adds label to display final score.
        var finalScoreLabel = UILabel(frame: CGRectMake(0, 267, 320, 20))
        finalScoreLabel.text = "Final Score \(currentScore)"
        finalScoreLabel.textColor = UIColor.whiteColor()
        finalScoreLabel.textAlignment = NSTextAlignment.Center
        
        gameOverView.addSubview(finalScoreLabel)
        
        // Defines and adds play again button to game over view.
        var playAgainButton = UIButton(frame: CGRectMake(0, 396, gameOverView.frame.size.width, 55))
        playAgainButton.setTitle("Play Again", forState: UIControlState.Normal)
        playAgainButton.backgroundColor = UIColor.redColor()
        playAgainButton.addTarget(self, action: Selector("startGame"), forControlEvents: UIControlEvents.TouchUpInside)
        gameOverView.addSubview(playAgainButton)
    }


}

