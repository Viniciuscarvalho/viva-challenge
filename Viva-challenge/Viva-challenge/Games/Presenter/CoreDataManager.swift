//
//  CoreDataManager.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 8/3/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import Foundation

final class CoreDataManager: CoreDataGateway {

    private let gateway: CoreDataGateway

    init(_ gateway: CoreDataGateway) {
        self.gateway = gateway
    }

    func save(_ objects: [Game]) {
        self.gateway.save(objects)
    }

}
