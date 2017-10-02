//
//  ViewController.swift
//  TapQuest
//
//  Created by Johan Sögaard on 2017-10-02.
//  Copyright © 2017 Verisure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonStartGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonStartGamePressed(_ sender: Any) {
        let game : GameViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameView") as! GameViewController;
        self.present(game, animated: true, completion: nil);
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

