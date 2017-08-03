//
//  GameCell.swift
//  Viva-challenge
//
//  Created by Vinicius Carvalho Marques on 29/07/17.
//  Copyright © 2017 Vinicius Carvalho. All rights reserved.
//

import UIKit
import AlamofireImage

class GameCell: UICollectionViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.gameImage.layer.cornerRadius = 4
    }
    
    func useThumbImage(_ imageURL: String) {
        gameImage.af_setImage(withURL: URL(string: imageURL)!)
    }

}
