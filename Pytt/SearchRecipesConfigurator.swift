//
//  RecipesConfigurator.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol SearchRecipesConfigurator {
    func configure(RecipeListViewController: RecipeListViewController)
}

class RecipeListConfiguratorImplementation: SearchRecipesConfigurator {
    
    func configure(RecipeListViewController: RecipeListViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
        let apiRecipesGateway = ApiRecipesGatewayImplementation(apiClient: apiClient)
        
        //Connect realm stuff here
        
        let recipeListUseCase = RecipeListUseCaseImplementation(recipesGateway: apiRecipesGateway)
        let router = SearchRecipesRouterImplementation(RecipeListViewController:
                                                        RecipeListViewController)
        
        let presenter = SearchRecipesPresenterImplementation(view: RecipeListViewController,
                                                             recipeListUseCase: recipeListUseCase,
                                                             router: router)
        RecipeListViewController.presenter = presenter
    }
}
