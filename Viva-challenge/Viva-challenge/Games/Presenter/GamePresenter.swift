//
//  GamePresenter.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 31/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import Foundation
import UIKit

struct GamePresenter {
    
    func presentGameDetail(rootView: UIViewController) {
        let service = ServiceGames()
        LoadingHandler.show(on: rootView)  {
            service.getGames() { (_: [model]?) in
                if let gamesDetail = model {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let gameDetails = storyboard.instantiateViewController(withIdentifier: "GameDetailViewController") as! GameDetailViewController
                    gamesDetail.gamesModel = self.games[indexPath.row]
                    LoadingHandler.hide()
                    rootView.present(gamesDetails, animated: true, completion: nil)
                }
            }
        }
    }
}
