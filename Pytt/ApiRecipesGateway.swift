//
//  ApiRecipesGateway.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol ApiRecipesGateway: RecipesGateway {

}

class ApiRecipesGatewayImplementation: ApiRecipesGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes(ingredients: String, completionHandler: @escaping FetchRecipesEntityGatewayCompletionHandler) {
        //FINiSH
    }
}
