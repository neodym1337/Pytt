//
//  DisplayRecipeSearchList.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation
import RxSwift

typealias RecipeListCompletionHandler = (_ recipes: Result<[Recipe]>) -> Void

protocol RecipeListUseCase {
    func fetchRecipes(ingerdients: String) -> Observable<[Recipe]>
    func displayRecipes(ingredients: String, completionHandler: @escaping RecipeListCompletionHandler)
}

class RecipeListUseCaseImplementation: RecipeListUseCase {
    let recipesGateway: RecipesGateway
    
    init(recipesGateway: RecipesGateway) {
        self.recipesGateway = recipesGateway
    }
    
    // MARK: - DisplayRecipeSearchListUseCase
    
    func fetchRecipes(ingerdients: String) -> Observable<[Recipe]> {
        return Observable.create { [unowned self] observer in
            self.recipesGateway.fetchRecipes(ingredients: ingerdients) { result in
                switch result {
                case let .success(recipes):
                    observer.onNext(recipes)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    func displayRecipes(ingredients: String, completionHandler: @escaping RecipeListCompletionHandler) {
        self.recipesGateway.fetchRecipes(ingredients: ingredients) { (result) in
            completionHandler(result)
        }
    }
}
