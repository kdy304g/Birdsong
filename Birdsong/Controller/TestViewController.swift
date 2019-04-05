//
//  TestViewController.swift
//  Birdsong
//
//  Created by Danny Kang on 4/1/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import UIKit
import AVFoundation

class TestViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerChoices: UIPickerView!
    
    var audioPlayer : AVAudioPlayer!
    
    let allQuestions = QuestionSet()
    var choices = AnswerSet()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let audioURL = bundle.url(forResource: "Mountain Chickadee", withExtension: "mp3")
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL!)
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
        }
    }
    
    //MARK: delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    //MARK: methods for playing sounds
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
    
    @IBAction func choosePressed(_ sender: Any) {
        
        //if text of picker item equals question.answer, alert correct else wrong
        
    }
    
}
