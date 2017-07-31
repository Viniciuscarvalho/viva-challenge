//
//  Game.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Game {

    let nameGame: String?
    let viewers: Int?
    let channels: Int?
    let boxImage: BoxEntity?
    
    init(json: JSON) {
        self.nameGame = json["name"].stringValue
        self.viewers = json["viewers"].int
        self.channels = json["channels"].int
        self.boxImage = BoxEntity(json: json["box"])
    }
}
