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
    var title:String { get }
    var imageUrl:URL { get }
    var rating:Double { get }
}

class RecipeCellPresenterImplementation: RecipeCellPresenter {
    
    var title: String
    fileprivate let rank:Double!
    fileprivate let imageUrlString:String!
    
    var imageUrl:URL {
        get {
            return URL(string: dummyImage)!
        }
    }
    
    var rating:Double {
        get {
            return Double(arc4random_uniform(5) + 1)
        }
    }
    
    init(title:String, rank:Double, imageUrlString:String) {
        self.title = title
        self.rank = rank
        self.imageUrlString = imageUrlString
    }
}

