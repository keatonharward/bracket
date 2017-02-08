//
//  Team + Convenience.swift
//  Bracket
//
//  Created by Keaton Harward on 2/8/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation
import CoreData

extension Team {
    convenience init(name: String, seed: Int? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        if let seed = seed {
            self.seed = Int16(seed)
        }
    }
}
