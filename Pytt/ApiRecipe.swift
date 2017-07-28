//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import Foundation

struct ApiRecipe: InitializableWithData, InitializableWithJson {
    var id: String
    var title: String
    var rank: Float
    var imageUrl:String
    var sourceUrl:String
    
    init(data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let json = jsonObject as? [String: Any] else {
            throw NSError.createPraseError()
        }
        try self.init(json: json)
    }
    
    init(json: [String : Any]) throws {
        guard let id = json["recipe_id"] as? String,
            let title = json["title"] as? String,
            let rank = json["social_rank"] as? Float,
            let imageUrl = json["image_url"] as? String,
            let sourceUrl = json["source_url"] as? String
        else {
                throw NSError.createPraseError()
        }
        
        self.id = id
        self.title = title
        self.rank = rank
        self.imageUrl = imageUrl
        self.sourceUrl = sourceUrl
    }
}

extension ApiRecipe {
    var book: Recipe {
        return Recipe(id: id,
                      title: title,
                      rank: rank,
                      imageUrl: imageUrl,
                      sourceUrl: sourceUrl)
    }
}
