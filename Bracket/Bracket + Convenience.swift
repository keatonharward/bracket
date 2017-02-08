//
//  Bracket + Convenience.swift
//  Bracket
//
//  Created by Keaton Harward on 2/8/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation
import CoreData

extension Bracket {
    convenience init(name: String, seeded: Bool, teams: [Team] = [], context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.seeded = seeded
        self.teams = NSOrderedSet(array: teams) // not sure if I need this or not
    }
}
