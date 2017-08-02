//
//  RecipeTableViewCell.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

protocol SearchRecipesTableViewCell {
    func display(title: String)
    func display(imageUrl: URL)
    func display(rating:Double)
}

class SearchRecipesTableViewCellImplementation: UITableViewCell, SearchRecipesTableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    func display(title: String) {
        titleLabel.text = title
    }
    
    func display(rating: Double) {
        ratingView.rating = rating
    }
    
    func display(imageUrl: URL) {
        foodImageView.sd_setImage(with: imageUrl)
    }
    
    static var defaultReuseIdentifier: String {
        return "SearchRecipesTableViewCell"
    }
}
