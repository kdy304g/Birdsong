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
    let allBirds = ["American Crow", "American Goldfinch", "American Robin", "American Tree Sparrow", "Baltimore Oriole", "Barn Owl", "Barred Owl", "Black Capped Chickadee", "Bald Eagle", "Blue Jay", "Brown Headed Cowbird", "Canada Goose", "Carolina Wren", "Cedar Waxwing", "Chimney Swift", "Chipping Sparrow", "Common Starling", "Cooper's Hwak", "Dark Eyed Junco", "Eastern Phoebe", "Eastern Screech Owl", "Gray Jay", "great Black Backed Gull", "Great Blue Heron", "House Finch", "Laughing Gull", "Mallard", "Mourning Dove", "Northern Cardinal", "Osprey", "Peregrine Falcon", "Pileated Woodpecker", "Purple Finch", "Red Tailed Hawk", "Red Winged Blackbird", "Ring Billed Gull", "Song Sparrow", "Tufted Titmouse", "White Breasted Nuthatch", "White Throated Sparrow", "Wild Turkey", "Bluebird", "Common Poorwill", "Emperor Goose", "Grebe", "House Finch", "Killdeer", "Kingbird", "Purple Finch", "Screech Owl", "Tanager", "Wood Pewee", "Acorn Woodpecker", "Brown Headed Cowbird", "Cliff Swallow", "Great Blue Heron", "House Finch", "Lazuli Bunting", "Phainopepla", "Pinyon Jay", "Red Winged Blackbird", "Western Bluebird", "Western Meadowlark", "Western Sandpiper", "Brown Thrasher", "Carolina Wren", "Cedar Waxwing", "Eastern Meadowlark", "Great Egret", "Hooded Merganser", "Northern Cardinal", "Painted Bunting", "Snowy Plover", "Swamp Sparrow"]
    
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
