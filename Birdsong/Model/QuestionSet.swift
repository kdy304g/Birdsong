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
    
    init() {
        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "chickadee"))
        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "chickadee"))
        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "chickadee"))
        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "chickadee"))
        listQuestions.append(Question(fileName: "Mountain Chickadee", correctAnswer: "chickadee"))

    }
}
