//
//  RecipeTableViewCell.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import UIKit

protocol SearchRecipesTableViewCell {
    func display(title: String)
    func display(imageUrl: String)
    func display(rating:String)
}

class SearchRecipeTableViewImplementation: UITableViewCell, SearchRecipesTableViewCell {
    
    func display(title: String) {
        
    }
    
    func display(rating: String) {
        
    }
    
    func display(imageUrl: String) {
        
    }
}
