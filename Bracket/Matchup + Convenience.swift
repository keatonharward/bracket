//
//  Matchup + Convenience.swift
//  Bracket
//
//  Created by Keaton Harward on 2/8/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation
import CoreData

extension Matchup {
    convenience init(teams: [Team], context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.teams = NSOrderedSet(array: teams)
    }
}
