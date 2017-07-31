//
//  BoxEntity.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BoxEntity {
    let large: String
    let medium: String
    let small: String
    let template: String
    
    init(json: JSON) {
        self.large = json["large"].stringValue
        self.medium = json["medium"].stringValue
        self.small = json[""].stringValue
        self.template = json["template"].stringValue
    }
    
}
