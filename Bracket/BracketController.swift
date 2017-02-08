//
//  BracketController.swift
//  Bracket
//
//  Created by Keaton Harward on 2/7/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation

class BracketController {
    
    func createBracketStructure(bracket: Bracket) -> [String:[matchup]] {
        let numberOfRounds = findRounds(bracket: bracket)
        let rounds = findMatchups(teams: bracket.teams, numberOfRounds: numberOfRounds)
        
        // randomize teams if seeding is set to random
        if bracket.seeded == false {
            // TODO: - implement randomize function
        }
        
        let seededWithTeams = seedTeams(teams: bracket.teams, rounds: rounds)
        
        return seededWithTeams
    }
    
    // Calculate the number of rounds in the tournament
    
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
    
    // create matchup objects for every game in the tournament
    
    func findMatchups(teams: [Team], numberOfRounds: Int) -> [String:[matchup]] {
        let totalGames = teams.count - 1
        var matchupsInRound = 1
        var currentRound = numberOfRounds
        var matchups = [String:[matchup]]()
        while currentRound > 0 {
            var remainingGamesInRound: Int
            var roundMatchups = [matchup]()
            if currentRound == 1 {
                remainingGamesInRound = totalGames - (2 ^ (numberOfRounds - 1))
            } else {
            remainingGamesInRound = matchupsInRound
            }
            
            while remainingGamesInRound > 0 {
                let newMatchup = matchup()
                roundMatchups.append(newMatchup)
                remainingGamesInRound -= 1
            }
            matchups["Round\(currentRound)"] = roundMatchups
            matchupsInRound *= 2
            currentRound -= 1
        }
        return matchups
    }
    
    // assign seeds to teams and add them to the appropriate matchups
    
    func seedTeams(teams: [Team], rounds: [String:[matchup]]) -> [String:[matchup]] {
        
        var seed = 1
        for team in teams {
            team.seed = seed
            seed += 1
        }
        
        var returnRounds = rounds
        let round1MatchupsOptional = returnRounds["Round1"]
        guard let round1Matchups = round1MatchupsOptional else {return rounds}
        let round2MatchupsOptional = returnRounds["Round2"]
        guard let round2Matchups = round2MatchupsOptional else {return rounds}
        
        if (round1Matchups.count * 2) < teams.count {
            var round2Teams = teams.dropLast(round1Matchups.count * 2)
            var round1Teams = teams.dropFirst(round2Teams.count)
            var playInCounter = round1Matchups.count
            
            for matchup in round1Matchups {
                matchup.teams.append(round1Teams.first)
                round1Teams.removeFirst()
                matchup.teams.append(round1Teams.popLast())
            }
            returnRounds.updateValue(round1Matchups, forKey: "Round1")
            
            for matchup in round2Matchups {
                if playInCounter > 0 {
                    matchup.teams.append(round2Teams.first)
                    round2Teams.removeFirst()
                    playInCounter -= 1
                } else {
                    matchup.teams.append(round2Teams.first)
                    round2Teams.removeFirst()
                    matchup.teams.append(round2Teams.popLast())
                }
                returnRounds.updateValue(round2Matchups, forKey: "Round2")
            }
            
            
        } else {
            var round1Teams = teams
            for matchup in round1Matchups {
                matchup.teams.append(round1Teams.first)
                round1Teams.removeFirst()
                matchup.teams.append(round1Teams.popLast())
            }
            returnRounds.updateValue(round1Matchups, forKey: "Round1")
        }
        return returnRounds
    }
    
}

