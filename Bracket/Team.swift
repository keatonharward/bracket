//
//  Team.swift
//  Bracket
//
//  Created by Keaton Harward on 2/7/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation

class Team {
    
    let name: String
    var gamesPlayed: [Int:Bool]?
    var seed: Int?
    
    init(name: String, gamesPlayed: [Int:Bool]? = nil, seed: Int? = nil) {
        self.name = name
        self.gamesPlayed = gamesPlayed
        self.seed = seed
    }
}
