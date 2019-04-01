//
//  TestViewController.swift
//  Birdsong
//
//  Created by Danny Kang on 4/1/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import UIKit
import AVFoundation

class TestViewController: UIViewController {
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        let bundle = Bundle.main
        let audioURL = bundle.url(forResource: "Mountain Chickadee", withExtension: "mp3")
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL!)
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
        }
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        if let player = audioPlayer {
            player.play()
        }
    }
    
    @IBAction func stopAudio(_ sender: UIButton) {
        if let player = audioPlayer {
            player.stop()
            player.currentTime = 0
        }
    }
    
    @IBAction func pauseAudio(_ sender: UIButton) {
        if let player = audioPlayer {
            player.pause()
        }
    }
    
    @IBAction func enter(_ sender: UIButton) {
        if answerTextField.text == "chickadee" {
            resultLabel.text = "Correct!"
        } else {
            resultLabel.text = "Wrong!"
        }
    }
    
    @IBAction func didFinishEnter() {
        if answerTextField.text == "chickadee" {
            resultLabel.text = "Correct!"
        } else {
            resultLabel.text = "Wrong!"
        }
    }
    
}
