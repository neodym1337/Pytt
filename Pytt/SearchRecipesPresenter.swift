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
    func configure(cell: SearchRecipesTableViewCell, forRow row: Int) //TODO: Change to my cell subclass
    func didSelect(row: Int)
    func searchRecipes(for ingredients: String)
}

class SearchRecipesPresenterImplementation: SearchRecipesPresenter {


    fileprivate weak var view: SearchRecipesView?
    fileprivate let displayRecipeSearchListUseCase:DisplayRecipeSearchListUseCase
    
    internal let router: SearchRecipesRouter
    
    var recipes = [RecipeCellPresenter]()
    
    var numberOfRecipes: Int {
        return recipes.count
    }
    
    init(view: SearchRecipesView,
         displayRecipeSearchListUseCase: DisplayRecipeSearchListUseCase,
         router: SearchRecipesRouter) {
        self.view = view
        self.displayRecipeSearchListUseCase = displayRecipeSearchListUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        searchRecipes(for: "chicken") //TODO: Connect searchbar instead of hardcode
    }
    
    func configure(cell: SearchRecipesTableViewCell?, forRow row: Int) {
        let recipe = recipes[row]
        cell?.display(title: recipe.title)
        cell?.display(rating: recipe.rating)
        cell?.display(imageUrl: recipe.imageUrl)
    }
    
    func didSelect(row: Int) {
        //TODO: Finish implementationa
        //let recipe = recipes[row]
        //router.presentDetailsView(for: recipe)
    }
    
    func searchRecipes(for ingredients: String) {
        print("Search recipes")
        self.displayRecipeSearchListUseCase.displayRecipes(ingredients: ingredients) { [unowned self] (result) in
            switch result {
            case let .success(recipes):
                self.handleRecipesReceived(recipes: recipes)
            case let .failure(error):
                self.handleRecipesError(error: error)
            }
        }
    }
    
    fileprivate func handleRecipesReceived(recipes: [Recipe]) {
        print("Did recieve recipes")
        self.recipes = recipes.map {
            return RecipeCellPresenterImplementation(title: $0.title, rank: $0.rank, imageUrlString: $0.imageUrl)
        }
        
        view?.refreshRecipesView()
    }
    
    fileprivate func handleRecipesError(error:Error) {
        view?.displayRecipesRetrievalError(title: "Error", message: error.localizedDescription)
    }
    
}




