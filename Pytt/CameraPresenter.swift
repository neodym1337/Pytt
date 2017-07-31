//
//  CameraPresenter.swift
//  Pytt
//
//  Created by Johan Hosk on 31/07/17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit

protocol CameraView: class {
    func identifiedObject(object:String)
    func failedToIdentifyObject(message:String)
}

protocol CameraPresenter {
    
//    var numberOfRecipes: Int { get }
//    var router: SearchRecipesRouter { get }
//    func viewDidLoad()
//    func configure(cell: String, forRow row: Int) //TODO: Change to my cell subclass
//    func didSelect(row: Int)
}

class CameraPresenterImplementation: CameraPresenter {
    fileprivate weak var view: CameraView?
    //fileprivate let displayRecipeSearchListUseCase:DisplayRecipeSearchListUseCase
    
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
