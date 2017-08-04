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
    func display(rating: Double)
}

class SearchRecipesTableViewCellImplementation: UITableViewCell, SearchRecipesTableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        setStyle()
    }
    
    fileprivate func setStyle() {
        selectionStyle = UITableViewCellSelectionStyle.none
        ratingView.settings.updateOnTouch = false
        foodImageView.contentMode = .scaleAspectFill
        foodImageView.layer.cornerRadius = foodImageView.frame.size.width * 0.5
        foodImageView.clipsToBounds = true
        foodImageView.layer.borderWidth = 2.0
        foodImageView.layer.borderColor = UIColor.darkBackground.cgColor
        
        backgroundColor = UIColor.lightBackground
        contentView.layer.borderColor = UIColor.border.cgColor
        
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.darkText
        
        ratingView.backgroundColor = UIColor.lightBackground
        ratingView.settings.emptyBorderColor = UIColor.affirmation
        ratingView.settings.emptyColor = UIColor.clear
        ratingView.settings.filledBorderColor = UIColor.affirmation
        ratingView.settings.filledColor = UIColor.affirmation
    }
    
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
