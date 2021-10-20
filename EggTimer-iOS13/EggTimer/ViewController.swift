//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [ "Soft": 5, "Medium": 7, "Hard": 12 ] // Minutes
    var secondsRemaining = 0
    var interval: Float = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!
        let minutes = eggTimes[hardness]!
        secondsRemaining = minutes //* 60
        interval = 1.0 / Float(secondsRemaining)
        print("interval: \(interval)")
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            progressBar.progress += interval
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
