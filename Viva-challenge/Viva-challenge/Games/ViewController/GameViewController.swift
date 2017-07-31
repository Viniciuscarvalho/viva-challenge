//
//  GameViewController.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 27/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

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
    
    //Mark: Refresh
    
    func didPullRefresh(_ refreshControl: UIRefreshControl) {
    
    }


}
