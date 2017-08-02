//
//  DisplayRecipeSearchList.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

typealias RecipeListCompletionHandler = (_ recipes: Result<[Recipe]>) -> Void

protocol RecipeListUseCase {
    func displayRecipes(ingredients: String, completionHandler: @escaping RecipeListCompletionHandler)
}

class RecipeListUseCaseImplementation: RecipeListUseCase {
    let recipesGateway: RecipesGateway
    
    init(recipesGateway: RecipesGateway) {
        self.recipesGateway = recipesGateway
    }
    
    
    // MARK: - DisplayRecipeSearchListUseCase
    
    func displayRecipes(ingredients: String, completionHandler: @escaping RecipeListCompletionHandler) {
        self.recipesGateway.fetchRecipes(ingredients: ingredients) { (result) in
            completionHandler(result)
        }
    }
}
