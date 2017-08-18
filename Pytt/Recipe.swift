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
    static func decode(_ json: Any) throws -> Recipe {
        return try Recipe(
            id: json => "recipe_id",
            title: json => "title",
            rank: json => "social_rank",
            imageUrl: json => "image_url",
            sourceUrl: json => "source_url"
        )
    }
}
