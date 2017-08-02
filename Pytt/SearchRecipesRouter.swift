//
//  SearchRecipesRouter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit

protocol SearchRecipesRouter: ViewRouter {
    func presentDetailsView(for recipe: Recipe)
    func presentScanFoodView()
}

class SearchRecipesRouterImplementation: SearchRecipesRouter {
    fileprivate weak var searchRecipesTableViewController: SearchRecipesTableViewController?
    fileprivate var recipe: Recipe!
    
    init(searchRecipesTableViewController: SearchRecipesTableViewController) {
        self.searchRecipesTableViewController = searchRecipesTableViewController
    }
    
    func presentDetailsView(for recipe: Recipe) {
        self.recipe = recipe
        //Perform segue for detail view
    }
    
    func presentScanFoodView() {
        //perform
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
}
