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
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        let apiRecipesGateway = ApiRecipesGatewayImplementation(apiClient: apiClient)
        
        //Connect realm stuff here
        
        let displaySearchRecipesUseCase = DisplayRecipeSearchListUseCaseImplementation(recipesGateway: apiRecipesGateway)
        let router = SearchRecipesRouterImplementation(searchRecipesTableViewController: searchRecipesTableViewController)
        
        let presenter = SearchRecipesPresenterImplementation(view: searchRecipesTableViewController, displayRecipeSearchListUseCase: displaySearchRecipesUseCase, router: router)
        searchRecipesTableViewController.presenter = presenter
        
    }
}
