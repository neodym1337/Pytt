//
//  SearchRecipeTableViewCellPresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

let dummyImage = "https://static.pexels.com/photos/70497/pexels-photo-70497.jpeg"

protocol RecipeCellPresenter {
    var recipe: Recipe { get }
    var title: String { get }
    var imageUrl: URL { get }
    var rating: Double { get }
}

class RecipeCellPresenterImplementation: RecipeCellPresenter {
    
    var recipe: Recipe
    let title: String
    fileprivate let rank: Double!
    fileprivate let imageUrlString: String!
    
    var imageUrl: URL {
        return URL(string: imageUrlString)!
    }
    
    var rating: Double {
        return Double(arc4random_uniform(5) + 1)
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.title = recipe.title
        self.rank = recipe.rank
        self.imageUrlString = recipe.imageUrl
    }
}
