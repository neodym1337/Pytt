//
//  ApiRecipesGateway.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//


// Network layer consists of the Request, the dispatcher (client), the task (gateway) and the response 

import Foundation

protocol ApiRecipesGateway: RecipesGateway {
    //just inherit from RecipesGateway, if we want we can easily replace recipe api-gateway (soLid)
}

class ApiRecipesGatewayImplementation: ApiRecipesGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes(ingredients: String, completionHandler: @escaping FetchRecipesEntityGatewayCompletionHandler) {
        let request = RecipesApiRequest(ingredients: ingredients)
        apiClient.execute(request: request) { [unowned self] (result: Result<ApiResponse>) in
            switch result {
            case let .success(response):
                completionHandler(self.handleResponse(response: response))
                break
            case let .failure(error):
                completionHandler(.failure(error))
                break
            }
        }
    }
    
    func handleResponse(response: ApiResponse) -> Result<[Recipe]> {
        do {
            let jsonRoot = try JSONSerialization.jsonObject(with: response.data, options: [])
            guard let dictionary = jsonRoot as? [String: Any] else {
                throw NSError.parseError()
            }
            guard let recipesArray = dictionary["recipes"] as? [Any] else {
                throw NSError.parseError()
            }
            let recipes = try [Recipe].decode(recipesArray)
            return .success(recipes)
        } catch {
            print(error)
            return .failure(error)
        }
    }
}
