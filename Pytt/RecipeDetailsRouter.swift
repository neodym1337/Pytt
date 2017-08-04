//
//  RecipeDetailsRouter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol RecipeDetailsRouter: ViewRouter {
    func dismiss()
}

class RecipeDetailsRouterImplementation: RecipeDetailsRouter {

    fileprivate weak var recipeDetailsViewController: RecipeDetailsViewController?
    
    public init(recipeDetailsViewController: RecipeDetailsViewController) {
        self.recipeDetailsViewController = recipeDetailsViewController
    }
    
    // MARK: - RecipeDetailsRouter
    
    func dismiss() {
        //recipeDetailsViewController?.dismiss(animated: , completion: )
    }

}
