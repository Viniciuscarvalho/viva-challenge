//
//  CoreDataRepository.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 8/3/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataRepository: CoreDataGateway {

    func save(_ objects: [Game]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Games", in: managedContext)!

        objects.forEach { (element) in
            let game = NSManagedObject(entity: entity, insertInto: managedContext)

            game.setValue(element.nameGame, forKey: "name")
            game.setValue(element.boxImage?.medium, forKey: "image")
            game.setValue(element.channels, forKey: "channels")
            game.setValue(element.viewers, forKey: "viewers")

            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }

}
