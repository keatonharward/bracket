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
    
    func findMatchups(teams: [Team], numberOfRounds: Int) -> [String:[matchup]] {
        var totalGames = teams.count - 1
//        var firstRoundGames = gamesRemaining - (2 ^ (numberOfRounds - 1))
        var matchupsInRound = 1
        var currentRound = numberOfRounds
        while currentRound > 0 {
            var remainingGamesInRound: Int
            if currentRound == 1 {
                remainingGamesInRound = totalGames - (2 ^ (numberOfRounds - 1))
            } else {
            remainingGamesInRound = matchupsInRound
            }
            while remainingGamesInRound > 0 {
//                let matchup = initialize an empty matchup to fill with teams lata
                remainingGamesInRound -= 1
            }
            matchupsInRound *= 2
            currentRound -= 1
        }
        
    }
    
}

// [String:[[Int:Team]]]
