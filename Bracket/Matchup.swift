//
//  Matchup.swift
//  Bracket
//
//  Created by Keaton Harward on 2/7/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation

class matchup {
    
    var teams: [Team?]
    var winner: Team?
    var loser: Team?
    
    init(teams: [Team?] = [nil], winner: Team? = nil, loser: Team? = nil) {
    self.teams = teams
    self.winner = winner
    self.loser = loser
    }
}
