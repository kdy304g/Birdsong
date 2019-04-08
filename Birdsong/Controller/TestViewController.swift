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
    var allQuestions = QuestionSet()
    var answerSet = AnswerSet()
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerChoices.delegate = self
        pickerChoices.dataSource = self
        
        if let index = answerSet.options.firstIndex(of: "chickadee") {
            pickerChoices.selectRow(index, inComponent: 0, animated: false)
        }
        let bundle = Bundle.main
        let audioURL = bundle.url(forResource: "Mountain Chickadee", withExtension: "mp3")
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL!)
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
        }
        pickedAnswer = answerSet.options[0]
        print(answerSet.options)
    }
    
    // MARK: delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answerSet.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rowPicked = pickerChoices.selectedRow(inComponent: 0)
        pickedAnswer = answerSet.options[rowPicked]
        print("pickedAnswer: \(pickedAnswer)")
    }
    
    // MARK: methods for playing sounds
    @IBAction func playAudio(_ sender: UIButton) {
        if let player = audioPlayer {
            player.play()
        }
    }
    
    
//    @IBAction func stopAudio(_ sender: Any) {
//        if let player = audioPlayer {
//            player.stop()
//            player.currentTime = 0
//        }
//    }
//
//    @IBAction func pauseAudio(_ sender: UIButton) {
//        if let player = audioPlayer {
//            player.pause()
//        }
//    }
    
    // MARK: button related action
    
    @IBAction func choosePressed(_ sender: Any) {
        if allQuestions.listQuestions[questionNumber].answer == pickedAnswer {
            showResult(title: "correct!")
        } else {
            showResult(title: "wrong!")
        }
    }
    
    // MARK: notifications
    
    func showResult(title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: question related methods
    func createQuestionSet() {
        
    }
    
    
}
    


