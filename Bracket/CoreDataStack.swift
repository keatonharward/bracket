//
//  CoreDataStack.swift
//  Bracket
//
//  Created by Keaton Harward on 2/8/17.
//  Copyright © 2017 KeatonHarward. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Bracket")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error as NSError? {
                fatalError("Error loading persistent stores: \(error)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
