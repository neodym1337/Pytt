//
//  RecipeDetailsConfigurator.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol RecipeDetailsConfigurator {
    func configure(recipeDetailsViewController: RecipeDetailsViewController)
}

class RecipeDetailsConfiguratorImplementation: RecipeDetailsConfigurator {
    
    func configure(recipeDetailsViewController: RecipeDetailsViewController) {
        let router = RecipeDetailsRouterImplementation(recipeDetailsViewController: recipeDetailsViewController)
        let presenter = RecipeDetailsPresenterImplementation(view: recipeDetailsViewController, router: router)
        recipeDetailsViewController.presenter = presenter
    }
}
