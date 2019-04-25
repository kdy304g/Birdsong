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
    let birdDict =
        ["New England":["Meadowlark", "Chickadee", "Owl", "Crow", "Duck"],
         "Massachusetts":["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"],
         "Maine":["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"],
         "New York":["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"],
         "New Hampshire":["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"],
         "Vermont":["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"]]
    
    init(region: String) {
        while listQuestions.count < 5 {
            let addQuestion = randomQuestion(region: region)
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
    
    func randomQuestion(region: String) -> Question {
        let number = Int.random(in: 0 ..< 5)
        let question = Question(fileName: birdDict[region]![number], correctAnswer: birdDict[region]![number])
        
        return question
    }
    
}

