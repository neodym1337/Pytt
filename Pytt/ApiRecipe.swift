//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ApiRecipe {
    var id: String
    var title: String
    var rank: Double
    var imageUrl: String
    var sourceUrl: String
    
    init(json: JSON) {
        self.id = json["recipe_id"].stringValue
        self.title = json["title"].stringValue
        self.rank = json["social_rank"].doubleValue
        self.imageUrl = json["image_url"].stringValue
        self.sourceUrl = json["source_url"].stringValue
    }
}

extension ApiRecipe {
    var recipe: Recipe {
        return Recipe(id: id,
                      title: title,
                      rank: rank,
                      imageUrl: imageUrl,
                      sourceUrl: sourceUrl)
    }
}
