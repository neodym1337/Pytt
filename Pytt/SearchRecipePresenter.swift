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
    var router: SearchRecipeRouter
}
