//
//  SearchRecipePresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit

protocol SearchRecipesView: class {
    func refreshRecipesView()
    func displayRecipesRetrievalError(title: String, message: String)
}

protocol SearchRecipesPresenter {
    var numberOfRecipes: Int { get }
    var router: SearchRecipesRouter { get }
    func viewDidLoad()
    func configure(cell: String, forRow row: Int) //TODO: Change to my cell subclass
    func didSelect(row: Int)
}

class SearchRecipesPresenterImplementation: SearchRecipesPresenter {
    fileprivate weak var view: SearchRecipeView?
    fileprivate let displayRecipeSearchListUseCase:DisplayRecipeSearchListUseCase
    
    internal let router:SearchRecipesRouter
    
    var recipes = [RecipeCellPresenter]()
    
    var numberOfRecipes: Int {
        return recipes.count
    }
    
    init(view:SearchRecipeView,
         displayRecipeSearchListUseCase: DisplayRecipeSearchListUseCase,
         router: SearchRecipesRouter) {
        self.view = view
        self.displayRecipeSearchListUseCase = displayRecipeSearchListUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        //reguster cell
        
    }
    
    func configure(cell: String, forRow row: Int) {
        //let recipe = recipes[row]
        
    }
    
    func didSelect(row: Int) {
        //TODO: Finish implementationa
        //let recipe = recipes[row]
        //router.presentDetailsView(for: recipe)
    }
    
    func searchRecipes(for ingredients: String) {
        self.displayRecipeSearchListUseCase.displayRecipes(ingredients: ingredients) { [unowned self] (result) in
            switch result {
            case let .success(recipes):
                self.recipes = recipes.map {
                    return RecipeCellPresenter(title: $0.title, rating: $0.rank, imageUrlString: $0.imageUrl)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
}




