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
    
    func presentAllGames(on rootView: UIViewController, completion: @escaping ([Game]?) -> Void) {
        let service = ServiceGames()
        LoadingHandler.show(on: rootView) {
            service.getGames(completion: { (gamesResponse, error) in
                if let allGames = gamesResponse {
                    LoadingHandler.hide()
                    self.save(objects: allGames)
                    completion(allGames)
                } else {
                    completion(nil)
                    self.showErroMessage(error: error)
                }
            })
        }
    }

    private func save(objects: [Game]?) {
        if let games = objects {
            let repository = CoreDataRepository()
            let coreDataManager = CoreDataManager(repository)
            coreDataManager.save(games)
        }
    }

    func showErroMessage(error: Error?) {
        fatalError(error?.localizedDescription ?? "Desculpe, tente novamente")
    }
    
    func presentGameDetail(_ rootController: GameViewController, _ game: Game) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var gameDetailView: GameDetailViewController
        gameDetailView = storyboard.instantiateViewController(withIdentifier: String(describing: GameDetailViewController.self)) as! GameDetailViewController
        gameDetailView.gamesModel = game
        rootController.navigationController?.pushViewController(gameDetailView, animated: true)
    }
}
