//
//  QuestionSet.swift
//  Birdsong
//
//  Created by Danny Kang on 4/5/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import Foundation

class QuestionSet {
    var listQuestions = [Question]()
    let everyQuestions = ["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"]
    
    init() {
        while listQuestions.count < 6 {
            let addQuestion = randomQuestion()
            if listQuestions.contains(addQuestion) {
                continue
            } else {
                listQuestions.append(addQuestion)
            }
        }
//        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "Chickadee"))
//        listQuestions.append(Question(fileName: "Meadowlark", correctAnswer: "Meadowlark"))
//        listQuestions.append(Question(fileName: "Duck", correctAnswer: "Duck"))
//        listQuestions.append(Question(fileName: "Crow", correctAnswer: "Crow"))
//        listQuestions.append(Question(fileName: "Owl", correctAnswer: "Owl"))
    }
    
    func randomQuestion() -> Question {
        let number = Int.random(in: 0 ..< 10)
        let question = Question(fileName: everyQuestions[number], correctAnswer: everyQuestions[number])
        
        return question
    }
    
}

