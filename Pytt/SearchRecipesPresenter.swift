//
//  SearchRecipePresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import RxSwift

protocol RecipeListView: class {
    func refreshRecipesView()
    func displayRecipesRetrievalError(title: String, message: String)
}

protocol RecipeListPresenter {
    var numberOfRecipes: Int { get }
    var router: SearchRecipesRouter { get }
    func viewDidLoad()
    func configure(cell: SearchRecipesTableViewCell, forRow row: Int) //TODO: Change to my cell subclass
    func didSelect(row: Int)
    func searchRecipes(for ingredients: String)
    func height(forRow row: Int) -> CGFloat
}

class SearchRecipesPresenterImplementation: RecipeListPresenter {

    fileprivate weak var view: RecipeListView?
    fileprivate let recipeListUseCase: RecipeListUseCase
    
    internal let router: SearchRecipesRouter
    
    var recipes = [RecipeCellPresenter]()
    
    var numberOfRecipes: Int {
        return recipes.count
    }
    
    init(view: RecipeListView,
         recipeListUseCase: RecipeListUseCase,
         router: SearchRecipesRouter) {
        self.view = view
        self.recipeListUseCase = recipeListUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        searchRecipes(for: "chicken") //TODO: Connect searchbar instead of hardcode
    }
    
    func configure(cell: SearchRecipesTableViewCell, forRow row: Int) {
        let recipe = recipes[row]
        cell.display(title: recipe.title)
        cell.display(rating: recipe.rating)
        cell.display(imageUrl: recipe.imageUrl)
        
    }
    
    func height(forRow row: Int) -> CGFloat {
        return 100
    }
    
    func didSelect(row: Int) {
        let recipe = recipes[row]
        router.presentDetailsView(for: recipe.recipe)
    }
    
    func searchRecipes(for ingredients: String) {
        print("Search recipes")
        
        self.recipeListUseCase.displayRecipes(ingredients: ingredients) { [unowned self] (result) in
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
            return RecipeCellPresenterImplementation(recipe: $0)
        }
        view?.refreshRecipesView()
    }
    
    fileprivate func handleRecipesError(error: Error) {
        view?.displayRecipesRetrievalError(title: "Error", message: error.localizedDescription)
    }
    
}
