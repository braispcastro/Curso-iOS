//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageViewLeft: UIImageView!
    @IBOutlet weak var diceImageViewRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change images
        diceImageViewLeft.image = UIImage(imageLiteralResourceName: "DiceOne")
        diceImageViewRight.image = UIImage(imageLiteralResourceName: "DiceOne")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [ UIImage(imageLiteralResourceName: "DiceOne"),
          UIImage(imageLiteralResourceName: "DiceTwo"),
          UIImage(imageLiteralResourceName: "DiceThree"),
          UIImage(imageLiteralResourceName: "DiceFour"),
          UIImage(imageLiteralResourceName: "DiceFive"),
          UIImage(imageLiteralResourceName: "DiceSix") ]
        
        var roll = 0
        
        // Roll first dice
        roll = Int.random(in: 0...5)
        diceImageViewLeft.image = diceArray[roll]
        
        // Roll second dice
        roll = Int.random(in: 0...5)
        diceImageViewRight.image = diceArray[roll]
    }
    
}

