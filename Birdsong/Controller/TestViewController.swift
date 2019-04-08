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
    var audioURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.pickerChoices)
        pickerChoices.delegate = self
        pickerChoices.dataSource = self
        
        if let index = answerSet.options.firstIndex(of: "chickadee") {
            pickerChoices.selectRow(index, inComponent: 0, animated: false)
        }
        nextQuestion()
        pickedAnswer = answerSet.options[0]
        print("\(answerSet.options)")
    }
    
    // MARK: delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
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
        if questionNumber <= 3 {
            if allQuestions.listQuestions[questionNumber].answer == pickedAnswer {
                showResult(title: "correct!")
            } else {
                showResult(title: "wrong!")
            }
            questionNumber += 1
            nextQuestion()
        } else {
            if allQuestions.listQuestions[questionNumber].answer == pickedAnswer {
                let alert = UIAlertController(title: "Correct!", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                let backToMenuAction = UIAlertAction(title: "Menu", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                alert.addAction(restartAction)
                alert.addAction(backToMenuAction)
                present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Wrong!", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                let backToMenuAction = UIAlertAction(title: "Menu", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                alert.addAction(restartAction)
                alert.addAction(backToMenuAction)
                present(alert, animated: true, completion: nil)
            }
        }
        
        
        print("\(questionNumber)")
    }
    
    // MARK: notifications
    
    func showResult(title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            alert.dismiss(animated: true, completion: nil)
            UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.pickerChoices)
        }
    }
    
    // MARK: question related methods
    func createQuestionSet() {
        // please fill this out @Nate
    }
    
    func startOver() {
        
        questionNumber = 0
//        score = 0
//
//        updateUI()
        
        nextQuestion()
        
//        print("starting over! questionNumber is \(questionNumber)")
        
    }
    
    func nextQuestion() {
        
        let title = allQuestions.listQuestions[questionNumber].soundFile
        let bundle = Bundle.main
        
        audioURL = bundle.url(forResource: title, withExtension: "mp3")
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL!)
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            if let player = self.audioPlayer {
                player.play()
            }
        }
//        print("correct answer: \(title), \(allQuestions.listQuestions[questionNumber].soundFile)")
    }
}
    


