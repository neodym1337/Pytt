//
//  SearchRecipeTableViewCellPresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation


class RecipeCellPresenter {
    
    let title:String!
    let rating:Float!
    let imageUrlString:String!
    
    init(title:String, rating:Float, imageUrlString:String) {
        self.title = title
        self.rating = rating
        self.imageUrlString = imageUrlString
    }
}

