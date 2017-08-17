//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation
import Decodable

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

extension Recipe: Decodable {
    static func decode(j: Any) throws -> Recipe {
        return try Recipe(
            id: j => "recipe_id",
            title: j => "title",
            rank: j => "social_rank",
            imageUrl: j => "image_url",
            sourceUrl: j => "source_url"
        )
    }
}
