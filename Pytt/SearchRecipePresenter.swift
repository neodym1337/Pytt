//
//  SearchRecipePresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import Foundation

protocol SearchRecipeView: class {
    func refreshRecipesView()
    func displayRecipesRetrievalError(title: String, message: String)
}

protocol RecipeCellView {
    func display(title: String)
    func display(imageUrl: String)
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
    
    var recipes = [Recipe]()
    
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
        
    }
    
    func configure(cell: String, forRow row: Int) {
        //let recipe = recipes[row]
        
    }
    
    func didSelect(row: Int) {
        let book = books[row]
        router.presentDetailsView(for: book)
    }
    
    func triggerSearch() {
        self.displayRecipeSearchListUseCase.displayRecipes(ingredients: "test") { (result) in
            switch result {
            case let .success(books):
                //self.handleBooksReceived(books)
                print(books)
            case let .failure(error):
                //self.handleBooksError(error)
                print(books)

            }
        }
    }
    
}




