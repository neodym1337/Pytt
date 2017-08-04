//
//  RecipesConfigurator.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol SearchRecipesConfigurator {
    func configure(searchRecipesTableViewController: SearchRecipesTableViewController)
}

class SearchRecipesConfiguratorImplementation: SearchRecipesConfigurator {
    
    func configure(searchRecipesTableViewController: SearchRecipesTableViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
        let apiRecipesGateway = ApiRecipesGatewayImplementation(apiClient: apiClient)
        
        //Connect realm stuff here
        
        let recipeListUseCase = RecipeListUseCaseImplementation(recipesGateway: apiRecipesGateway)
        let router = SearchRecipesRouterImplementation(searchRecipesTableViewController:
                                                        searchRecipesTableViewController)
        
        let presenter = SearchRecipesPresenterImplementation(view: searchRecipesTableViewController,
                                                             recipeListUseCase: recipeListUseCase,
                                                             router: router)
        searchRecipesTableViewController.presenter = presenter
    }
}
