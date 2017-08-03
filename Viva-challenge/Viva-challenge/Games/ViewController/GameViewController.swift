//
//  GameViewController.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 27/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController {
    
    let gameDataSource = GameDatasource()
    var requestGames = ServiceGames()
    fileprivate let presenter = GamePresenter()
    
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(GameViewController.didPullRefresh(_:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    //Mark: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Games"
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = gameDataSource
        self.gameCollectionView.addSubview(self.refreshControl)
        self.showAllGames()
    }

    //Mark: Refresh
    
    func didPullRefresh(_ refreshControl: UIRefreshControl) {
        self.requestGames.nextPagination()
        self.showAllGames()
    }
    
    //Mark: Get Data
    
    private func showAllGames() {
        presenter.presentAllGames(on: self) { (games) in
            if self.refreshControl.isRefreshing{
                self.refreshControl.endRefreshing()
            }
            if let allGames = games {
                self.gameDataSource.games = allGames
                self.gameCollectionView.reloadData()
            }
        }
    }
    
    //Mark: Verify Connection
    
    func networkUnreachable() {
        
        let alert: UIAlertController = UIAlertController(title: "Aviso", message: "Por favor, verifique sua conexão.", preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
        if self.refreshControl.isRefreshing {
            self.refreshControl.endRefreshing()
        }
    }

}

extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedGame = gameDataSource.games[indexPath.row]
        presenter.presentGameDetail(self, selectedGame)
    }
}
