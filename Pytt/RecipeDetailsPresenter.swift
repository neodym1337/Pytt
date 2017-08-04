//
//  RecipeDetailsPresenter.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol RecipeDetailsView: class {
    
}

protocol RecipeDetailsPresenter {
    func viewDidLoad()
}

class RecipeDetailsPresenterImplementation: RecipeDetailsPresenter {
    
    fileprivate weak var view: RecipeDetailsView?
    private(set) var router: RecipeDetailsRouter
    
    init(view: RecipeDetailsView, router: RecipeDetailsRouter) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
    
    }
}
