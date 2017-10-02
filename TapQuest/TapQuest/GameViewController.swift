//
//  GameViewController.swift
//  TapQuest
//
//  Created by Johan Sögaard on 2017-10-02.
//  Copyright © 2017 Verisure. All rights reserved.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tilePressed(_ sender: Any) {
        let btn = sender as! UIButton;
        NSLog("Button pressed with ID : %lu", btn.tag);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
