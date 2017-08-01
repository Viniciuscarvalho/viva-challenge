//
//  GameViewController.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 27/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let gameDataSource = GameDatasource()
    var requestGames = ServiceGames()
    var games: NSArray = []
    
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
        self.gameCollectionView.addSubview(self.refreshControl)
        self.dataGames()
    }
    
    //Mark: Refresh
    
    func didPullRefresh(_ refreshControl: UIRefreshControl) {
        self.requestGames.nextPagination()
        self.dataGames()
    }
    
    //Mark: Get Data
    
    private func dataGames() {
        LoadingHandler.show(on: self) { [unowned self] in
            self.requestGames.getGames{ response in
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
                if case .success(let value) = response {
                    self.gameDataSource.games.append(contentsOf: value)
                    self.gameCollectionView.reloadData()
                }
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
