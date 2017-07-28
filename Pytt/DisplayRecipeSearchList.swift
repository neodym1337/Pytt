//
//  DisplayRecipeSearchList.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import Foundation

typealias DisplayRecipeSearchListCompletionHandler = (_ recipes: Result<[Recipe]>) -> Void

protocol DisplayRecipeSearchListUseCase {
    func displayRecipes(ingredients: String, completionHandler: @escaping DisplayRecipeSearchListCompletionHandler)
}

class DisplayRecipeSearchListUseCaseImplementation: DisplayRecipeSearchListUseCase {
    let recipesGateway: RecipesGateway
    
    init(recipesGateway: RecipesGateway) {
        self.recipesGateway = recipesGateway
    }
    
    
    //MARK: - DisplayRecipeSearchListUseCase
    
    func displayRecipes(ingredients: String, completionHandler: @escaping DisplayRecipeSearchListCompletionHandler) {
        self.recipesGateway.fetchRecipes(ingredients: ingredients) { (result) in
            completionHandler(result)
        }
    }
}
