//
//  GameDataSource.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import CoreData

class GameDatasource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    var games = [Game]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "GameCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GameCell
        let game = games[indexPath.row]
        
        if let nameGame = game.nameGame {
            cell.gameTitle.text = nameGame
        }
        
        if let imageGame = game.boxImage?.medium {
            cell.useThumbImage(imageGame)
        }
        
        return cell
    } 
}
