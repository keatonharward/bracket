//
//  BracketController.swift
//  Bracket
//
//  Created by Keaton Harward on 2/7/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation

class BracketController {
    
    func createBracketStructure(bracket: Bracket) -> [String:[[Int:Team]]] {
        let rounds = findRounds(bracket: bracket)
        
    }
    
    func findRounds(bracket: Bracket) -> Int {
        var gamesRemaining = bracket.teams.count - 1
        var numberOfRounds = 0
        var gamesPerRoundCounter = 1
        while gamesRemaining > 0 {
            numberOfRounds += 1
            gamesRemaining -= gamesPerRoundCounter
            gamesPerRoundCounter *= 2
        }
        return numberOfRounds
    }
    
    func findMatchups(teams: [Team]) -> [Matchup] {
        
    }
    
}

// [String:[[Int:Team]]]
