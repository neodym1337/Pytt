//
//  RecipesGateway.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

// Network layer consists of the Request, the dispatcher (client), the task (gateway) and the response


import Foundation

typealias FetchRecipesEntityGatewayCompletionHandler = (_ recipes: Result<[Recipe]>) -> Void

protocol RecipesGateway {
    func fetchRecipes(ingredients: String, completionHandler: @escaping FetchRecipesEntityGatewayCompletionHandler)
}
