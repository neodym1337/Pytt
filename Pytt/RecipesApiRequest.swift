//
//  RecipesApiRequest.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

//about http://food2fork.com/about/api
//apiKey = 055a3a352bf62b2fefbc53056a93828b
//All search requests should be made to the base search API URL. http://food2fork.com/api/search
//All recipe requests should be made to this URL: http://food2fork.com/api/get

//Ex search url http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken

//http://iyadagha.com/using-mvp-ios-swift/

// Network layer consists of the Request, the dispatcher (client), the task (gateway) and the response

//Inspired by testable network layer
//https://medium.com/ios-os-x-development/isolating-tasks-in-swift-or-how-to-create-a-testable-networking-layer-d0380e69f7e3

//Also https://academy.realm.io/posts/slug-jake-craige-modern-swift-networking-with-swish/

let apiKey = "055a3a352bf62b2fefbc53056a93828b"
let https = "https://"
let baseUrl = "food2fork.com"
let apiUrl = "/api/"
let searchApi = "search?"

struct RecipesApiRequest: ApiRequest {
    
    var urlRequest: URLRequest
    var ingredients: String
    
    init(withIngredients ingredients: String) {
        self.ingredients = ingredients
        let escapedIngredients = ingredients.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let urlString = https + baseUrl + apiUrl + searchApi + "key=" + apiKey + "&q=" + escapedIngredients
        let url = URL(string: urlString)!
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = "GET"
    }
}
