//
//  ServiceGames.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class ServiceGames {

    let ClientID = "99bnprkklh1ga3zs8mmcsa0vun1pdh"
    let URLGAMES = "https://api.twitch.tv/kraken/games/top?limite=10"
    
    var currentPage = 1
    
    func nextPagination() {
        self.currentPage += 1
    }
    
    func getGames(completion: @escaping (_ game: [Game]?,_ error: Error?) -> Void) {
        
        let url = "\(URLGAMES)\(currentPage)"
        let headers = [
            "Client-ID":ClientID
        ]
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: headers).responseJSON { response in
                            
                            switch response.result {
                            
                            case .success(let value):
                                let json = JSON(value)
                                let topJSON = json["top"].arrayValue
                                var games: [Game] = []
                                for game in topJSON {
                                    let currentGame = Game(json: game)
                                    games.append(currentGame)
                                }
                                completion(games, nil)
                                
                            case .failure(let error):
                                completion(nil, error)
                                
                            }
        }
                          
    }

}
