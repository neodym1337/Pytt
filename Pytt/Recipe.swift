//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

struct Recipe {
    var id: String
    var title: String
    var rank: Double
    var imageUrl: String
    var sourceUrl: String
}


// MARK: Equatable
extension Recipe: Equatable {}

// equatable func must be global
func == (lhs: Recipe, rhs: Recipe) -> Bool {
    return lhs.id == rhs.id
}
