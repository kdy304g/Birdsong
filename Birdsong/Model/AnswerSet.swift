//
//  AnswerSet.swift
//  Birdsong
//
//  Created by Danny Kang on 4/12/19.
//  Copyright © 2019 Danny Kang. All rights reserved.
//

import Foundation

class AnswerSet {
    var options = [String]()
    let allBirds = ["Eagle", "Goldfinch", "Goose", "Jay", "Sparrow", "Meadowlark", "Chickadee", "Owl", "Crow", "Duck"]
    
    init() {
        while options.count < 5 {
            let addOption = randomOption()
            if options.contains(addOption){
                continue
            } else {
                options.append(addOption)
            }
        }
    }
    
    func randomOption() -> String {
        let number = Int.random(in: 0 ..< 10)
        let option = allBirds[number]
        
        return option
    }
    
}
