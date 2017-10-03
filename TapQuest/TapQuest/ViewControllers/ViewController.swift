//
//  ViewController.swift
//  TapQuest
//
//  Created by Johan Sögaard on 2017-10-02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonStartGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initiateStartButtonAnimation();
    }
    
    private func initiateStartButtonAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIViewAnimationOptions.curveEaseIn, .repeat, .autoreverse, .allowUserInteraction], animations: {
            self.buttonStartGame.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            
        },completion: nil)
    }
    
    @IBAction func buttonStartGamePressed(_ sender: Any) {
        let game : GameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameView") as! GameViewController;
        self.present(game, animated: true, completion: nil);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

