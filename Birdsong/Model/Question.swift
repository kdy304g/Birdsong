//
//  Question.swift
//  Birdsong
//
//  Created by Danny Kang on 4/5/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import Foundation

class Question {
    
    let answer : String
    let soundFile : String
    
    init(fileName : String, correctAnswer : String) {
        soundFile = fileName
        answer = correctAnswer
    }
    
}

