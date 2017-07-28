//
//  ApiRecipesGateway.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import Foundation

protocol ApiRecipesGateway: RecipesGateway {

}

class ApiBooksGatewayImplementation: ApiRecipesGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes(ingredient: String, completionHandler: @escaping FetchRecipesEntityGatewayCompletionHandler) {
        
    }
}
