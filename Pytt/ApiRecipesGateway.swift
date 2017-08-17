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

}

class ApiRecipesGatewayImplementation: ApiRecipesGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRecipes(ingredients: String, completionHandler: @escaping FetchRecipesEntityGatewayCompletionHandler) {
        //FINiSH
        print("Fetch recipes ApiRecipesGateway")
        
        let request = RecipesApiRequest(ingredients: ingredients)
    
        apiClient.execute(request: request) { [unowned self] (result: Result<ApiResponse>) in
            switch result {
            case let .success(response):
                print("Got response")
                let recipes = self.handleResponse(response: response)
                completionHandler(.success(recipes))
                break
            case let .failure(error):
                print("Request failed with error: " + error.localizedDescription)
                completionHandler(.failure(error))
                break
            }
        }
    }
    
    func handleResponse(response: ApiResponse) -> [Recipe] {
        guard let json = try? JSONSerialization.jsonObject(with: response.data, options: []),
            let recipes = try? [Recipe].decode(json) else {
            return [Recipe]()
        }
        return recipes
    }
}
