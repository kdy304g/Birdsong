//
//  TestViewController.swift
//  Birdsong
//
//  Created by Danny Kang on 4/1/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import UIKit
import AVFoundation

protocol TestViewControllerDelegate: class {
    func testViewControllerGoBack(_ controller: TestViewController)
}

class TestViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerChoices: UIPickerView!
    @IBOutlet weak var score: UILabel!
    
    weak var delegate: TestViewControllerDelegate?
    
    let allBirds = ["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"]
    var audioPlayer : AVAudioPlayer!
    var allQuestions = QuestionSet()
    var currentQuestion = ""
    var answerSet = AnswerSet()
    var pickedAnswer : String = ""
    var questionNumber : Int = 0
    var resultMessage : String = ""
    var correct = 0
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
//        createAnswerSet()
        pickedAnswer = answerSet.options[0]
    }
    
    // MARK: delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answerSet.options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        pickerView.reloadAllComponents()
        return answerSet.options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rowPicked = pickerChoices.selectedRow(inComponent: 0)
        pickedAnswer = answerSet.options[rowPicked]
        print("pickedAnswer: \(pickedAnswer)")
//        pickerView.reloadAllComponents()
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
                correct += 1
                showResult(title: "correct!")
            } else {
                showResult(title: "wrong!")
            }
            questionNumber += 1
            nextQuestion()
//            createAnswerSet()
        } else {
            if allQuestions.listQuestions[questionNumber].answer == pickedAnswer {
                correct += 1
                motivationalMessage(score: correct)
                let alert = UIAlertController(title: "Correct!", message: resultMessage, preferredStyle: .alert)
                
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                let backToMenuAction = UIAlertAction(title: "Menu", style: .default, handler: { UIAlertAction in
                    self.backToViewController()
                })
                alert.addAction(restartAction)
                alert.addAction(backToMenuAction)
                present(alert, animated: true, completion: nil)
            } else {
                motivationalMessage(score: correct)
                let alert = UIAlertController(title: "Wrong!", message: resultMessage, preferredStyle: .alert)
                let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                    self.startOver()
                })
                let backToMenuAction = UIAlertAction(title: "Menu", style: .default, handler: { UIAlertAction in
                    self.backToViewController()
                })
                alert.addAction(restartAction)
                alert.addAction(backToMenuAction)
                present(alert, animated: true, completion: nil)
            }
        }
        updateScoreLabel()
        self.pickerChoices.reloadAllComponents()
//        pickerChoices.reloadAllComponents()
//        print("\(questionNumber)")
    }
    
    // MARK: notifications
    
    func showResult(title: String) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            alert.dismiss(animated: true, completion: nil)
            UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged, argument: self.pickerChoices)
        }
    }
    
    // MARK: question related methods
    
    func startOver() {
        let newQuestionSet = QuestionSet()
        questionNumber = 0
        correct = 0
        allQuestions = newQuestionSet
        updateScoreLabel()
        nextQuestion()
        self.pickerChoices.reloadAllComponents()
        
//        createAnswerSet()
//         pickerChoices.reloadAllComponents()
//        print("starting over! questionNumber is \(questionNumber)")
    }
    
    func nextQuestion() {
        
        currentQuestion = allQuestions.listQuestions[questionNumber].soundFile
        let bundle = Bundle.main

        audioURL = bundle.url(forResource: currentQuestion, withExtension: "mp3")
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL!)
        if audioPlayer != nil {
            audioPlayer.prepareToPlay()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            if let player = self.audioPlayer {
                player.play()
            }
        }
        
        let newAnswerSet = AnswerSet()
        answerSet = newAnswerSet
        if !(answerSet.options.contains(currentQuestion)) {
            answerSet.options[Int.random(in: 0...4)] = currentQuestion
        }
        print(currentQuestion)
        let index = answerSet.options.firstIndex(of: answerSet.options[0])
        self.pickerChoices.selectRow(index!, inComponent: 0, animated: true)
        
//        createAnswerSet()
//        pickerChoices.reloadAllComponents()
//        print("correct answer: \(title), \(allQuestions.listQuestions[questionNumber].soundFile)")
    }
//
//    func createAnswerSet(){
//        var newAnswerSet = [String]()
//
//        let answer = Int.random(in: 0 ..< 5)
//
//        while newAnswerSet.count < 6 {
//            let random = Int.random(in: 0...9)
//            let addChoice = allBirds[random]
//            if newAnswerSet.contains(addChoice) {
//                continue
//            } else if newAnswerSet.contains(currentQuestion) {
//                continue
//            } else {
//                newAnswerSet.append(addChoice)
//            }
//        }
//        newAnswerSet[answer] = currentQuestion
////        pickerChoices.reloadAllComponents()
//        answerSet = newAnswerSet
//        pickerChoices.reloadAllComponents()
//    }
//
    // MARK: - other methods
    func backToViewController () {
//        let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! ViewController
//
//       self.navigationController?.pushViewController(firstViewController, animated: true)
        //self.performSegue(withIdentifier: "backToMenuSegue", sender: nil)
//        delegate?.testViewControllerGoBack(self)
        navigationController?.popViewController(animated: true)
    }
    
    func updateScoreLabel() {
        score.text = "Score: \(correct) / 5"
    }
    
    func motivationalMessage(score: Int) {
        if score == 5 {
            resultMessage = "Perfect! you got \(correct) out of 5!"
        } else if score >= 3 {
            resultMessage = "Good job! you got \(correct) out of 5!"
        } else if score > 2 {
            resultMessage = "Not bad! you got \(correct) out of 5!"
        } else {
            resultMessage = "Keep practicing! you got \(correct) out of 5!"
        }
    }
}
