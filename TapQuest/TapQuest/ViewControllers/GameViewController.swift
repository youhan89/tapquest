//
//  GameViewController.swift
//  TapQuest
//
//  Created by Johan Sögaard on 2017-10-02.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var buttonGameTile01: UIButton!
    @IBOutlet weak var buttonGameTile02: UIButton!
    @IBOutlet weak var buttonGameTile03: UIButton!
    @IBOutlet weak var buttonGameTile04: UIButton!
    @IBOutlet weak var buttonGameTile05: UIButton!
    @IBOutlet weak var buttonGameTile06: UIButton!
    @IBOutlet weak var buttonGameTile07: UIButton!
    @IBOutlet weak var buttonGameTile08: UIButton!
    @IBOutlet weak var buttonGameTile09: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var statusButton: UIButton!
    var tiles : [Int : UIButton] = [:]
    var uiTimer : Timer = Timer()
    var litTile : Int = -1
    var score : Int = 0
    var lives : Int = 3
    var gameRunning : Bool = false
    
    var countdownTimer : Timer = Timer()
    var countdown = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initGame()
        self.refreshGameLoop()
    }
    
    func initGame() {
        tiles = [
            1 : self.buttonGameTile01,
            2 : self.buttonGameTile02,
            3 : self.buttonGameTile03,
            4 : self.buttonGameTile04,
            5 : self.buttonGameTile05,
            6 : self.buttonGameTile06,
            7 : self.buttonGameTile07,
            8 : self.buttonGameTile08,
            9 : self.buttonGameTile09
        ]
        
        self.score = 0
        self.setStatusTitle(title: "")
        
        self.countdownTimer.invalidate()
        self.countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdownUpdate), userInfo: nil, repeats: true)
    }
    
    func setStatusTitle( title : String ) {
        self.statusButton.setTitle(title, for: .normal)
    }
    
    @objc func countdownUpdate() {
        if(gameRunning){
            self.setStatusTitle(title: String(format: "%0.2d", countdown))
            countdown = countdown - 1
        }
        if(countdown < 1) {
            gameRunning = false
            uiTimer.invalidate()
            countdownTimer.invalidate()
            gameOver()
        }
    }
    
    func refreshGameLoop() {
        self.uiTimer.invalidate()
        self.uiTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        self.gameRunning = true;
    }
    
    @objc func update(){
        if(litTile != -1){
            let previousTile : UIButton = self.tiles[litTile]!
            previousTile.setImage(#imageLiteral(resourceName: "box_empty"), for: UIControlState.normal)
        }
        self.litTile = self.generateNextTile()
        
        let newTile : UIButton = self.tiles[litTile]!
        newTile.setImage(#imageLiteral(resourceName: "box_filled"), for: UIControlState.normal)
    }
    
    func refreshScoreLabel(score : Int) {
        self.scoreLabel.text = String(format: "%06d", score)
    }
    
    func generateNextTile() -> Int {
        let oldTile = litTile
        var newTile = -1
    
        repeat {
            newTile = Int(arc4random_uniform(9)) + 1
        } while(newTile == oldTile)
        return newTile
    }
    
    @IBAction func onStatusButtonClick(_ sender: Any) {
        dismiss(animated: true) {
            
        }
    }
    
    
    func gameOver() {
        self.gameRunning = false;
        self.uiTimer.invalidate();
        self.setStatusTitle(title: "Game Over")
    }
    
    @IBAction func tilePressed(_ sender: Any) {
        if(gameRunning){
            let pressedTileId = (sender as! UIButton).tag
            
            if (pressedTileId == self.litTile) {
                score = score + 1
            } else {
                lives = lives - 1
                if(lives <= 0){
                    self.gameOver()
                    return;
                }
                
                score = score - 1
                if(score < 0) {
                    score = 0
                }
            }
            self.refreshScoreLabel(score: score)
            
            
            self.uiTimer.fire()
            self.refreshGameLoop()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
