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
    let birdDict =
        ["Northeast":["American Crow", "American Goldfinch", "American Robin", "American Tree Sparrow", "Baltimore Oriole", "Barn Owl", "Barred Owl", "Black Capped Chickadee", "Bald Eagle", "Blue Jay", "Brown Headed Cowbird", "Canada Goose", "Carolina Wren", "Cedar Waxwing", "Chimney Swift", "Chipping Sparrow", "Common Starling", "Cooper's Hwak", "Dark Eyed Junco", "Eastern Phoebe", "Eastern Screech Owl", "Gray Jay", "great Black Backed Gull", "Great Blue Heron", "House Finch", "Laughing Gull", "Mallard", "Mourning Dove", "Northern Cardinal", "Osprey", "Peregrine Falcon", "Pileated Woodpecker", "Purple Finch", "Red Tailed Hawk", "Red Winged Blackbird", "Ring Billed Gull", "Song Sparrow", "Tufted Titmouse", "White Breasted Nuthatch", "White Throated Sparrow", "Wild Turkey"],
         "Northwest":["Bluebird", "Common Poorwill", "Emperor Goose", "Grebe", "House Finch", "Killdeer", "Kingbird", "Purple Finch", "Screech Owl", "Tanager", "Wood Pewee"],
         "Southwest":["Acorn Woodpecker", "Brown Headed Cowbird", "Cliff Swallow", "Great Blue Heron", "House Finch", "Lazuli Bunting", "Phainopepla", "Pinyon Jay", "Red Winged Blackbird", "Western Bluebird", "Western Meadowlark", "Western Sandpiper"],
         "Southeast":["Brown Thrasher", "Carolina Wren", "Cedar Waxwing", "Eastern Meadowlark", "Great Egret", "Hooded Merganser", "Northern Cardinal", "Painted Bunting", "Snowy Plover", "Swamp Sparrow"]
         ]
    
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

