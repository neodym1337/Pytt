//
//  RecipeDetailsViewController.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

// https://github.com/meismyles/SwiftWebVC

import UIKit
import SwiftWebVC


// RecipeDetails scene is currently not used, instead we push a basic web view on the nav stack from the search recipes router

class RecipeDetailsViewController: UIViewController, RecipeDetailsView {
    
    var configurator = RecipeDetailsConfiguratorImplementation()
    var presenter: RecipeDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
