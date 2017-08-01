//
//  GameDetailViewController.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 27/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    var gamesModel: Game!
    
    @IBOutlet weak var thumbImageDetail: UIImageView!
    @IBOutlet weak var nameGame: UILabel!
    @IBOutlet weak var channelsGame: UILabel!
    @IBOutlet weak var visualizationsGame: UILabel!
    
    //Mark: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Mark: Setup
    
    private var model: Game! {
        didSet {
            self.setupViewGame(model: model)
        }
    }
    
    func setupViewGame(model: Game) {
        nameGame.text = model.nameGame
        
        if let channelsValue = gamesModel.channels {
            let valueToString = String(channelsValue)
            channelsGame.text = valueToString
        }
        
        if let visualizationValue = gamesModel.viewers {
            let valueToString = String(visualizationValue)
            visualizationsGame.text = valueToString
        }
        
    }
    
}
