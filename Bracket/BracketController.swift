//
//  BracketController.swift
//  Bracket
//
//  Created by Keaton Harward on 2/7/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation

class BracketController {
    
    var brackets: [Bracket] = []
    
    func createBracket(withName name: String, seeded: Bool) {
        let bracket = Bracket(name: name, seeded: seeded)
        brackets.append(bracket)
    }
    
    func createTeam(withName name: String) {
        let team = Team(name: name)
    }
    
    func add(teams: [Team], toBracket bracket: Bracket) {
        
    }
    
    
    
    
    
    
    
    
    
    
    /*
    
    func createBracketStructure(bracket: Bracket) -> [String:[Matchup]] {
        let numberOfRounds = findRounds(bracket: bracket)
        guard let teams = bracket.teams?.array as? [Team] else { return [:] }
        let rounds = findMatchups(teams: teams, numberOfRounds: numberOfRounds)
        
        // randomize teams if seeding is set to random
        if bracket.seeded == false {
            // TODO: - implement randomize function
        }
        
        let seededTeams = seedTeams(teams: teams)
        
        // TODO: - figure out how to order the matchups properly for layout
        
        return
    }
    
    // Calculate the number of rounds in the tournament
    
    func findRounds(bracket: Bracket) -> Int {
        guard let teams = bracket.teams else {return 0}
        var gamesRemaining = teams.count - 1
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
    
    func findMatchups(teams: [Team], numberOfRounds: Int) -> [String:[Matchup]] {
        let totalGames = teams.count - 1
        var matchupsInRound = 1
        var currentRound = numberOfRounds
        var matchups = [String:[Matchup]]()
        while currentRound > 0 {
            var remainingGamesInRound: Int
            var roundMatchups = [Matchup]()
            if currentRound == 1 {
                remainingGamesInRound = totalGames - (2 ^ (numberOfRounds - 1))
            } else {
            remainingGamesInRound = matchupsInRound
            }
            
            while remainingGamesInRound > 0 {
                let newMatchup = Matchup()
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
    
    func seedTeams(teams: [Team]) -> [Team] {
        
        var seededTeams: [Team] = []
        var seed = 1
        
        for team in teams {
            team.seed = Int16(seed)
            seed += 1
            seededTeams.append(team)
        }
        return seededTeams
    }
    
     func insertTeamsIntoMatchups(teams: [Team], rounds: [String:[Matchup]]) -> [String:[Matchup]] {
    
        var returnRounds = rounds
        guard let round1Matchups = returnRounds["Round1"] else { return [:] }
        guard let round2Matchups = returnRounds["Round2"] else { return [:] }
        
        if (round1Matchups.count * 2) < teams.count {
            var round2Teams = teams.dropLast(round1Matchups.count * 2)
            var round1Teams = teams.dropFirst(round2Teams.count)
            var playInCounter = round1Matchups.count
            
            for matchup in round1Matchups {
                guard let teams = matchup.teams?.array as? [Team] else { return [:] }
                
                let firstTeam = round1Teams[0]
                let secondTeam = round1Teams[1]
                
                teams = [firstTeam]
                
                
                
                
                
                teams.append(round1Teams.first)
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
    */
}

