//
//  Book.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

@testable import Pytt

extension Recipe {
    
    static func createRecipeArray(numberOfElements: Int = 2) -> [Recipe] {
        var recipes = [Recipe]()
        
        for i in 0..<numberOfElements {
            let recipe = createRecipe(index: i)
            recipes.append(recipe)
        }
        return recipes
    }
    
    static func createRecipe(index: Int = 0) -> Recipe {
        return Recipe(id: "\(index)",
                    title: "\(index)",
                    rank: Double(index),
                    imageUrl: "\(index)",
                    sourceUrl: "\(index)")
    }
}
