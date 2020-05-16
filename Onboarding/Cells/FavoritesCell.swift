//
//  FavoritesCell.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static var identifier: String = "FavoritesCell"
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var favoritesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    func setup(){
        imageView.layer.cornerRadius = 10
    }

}
