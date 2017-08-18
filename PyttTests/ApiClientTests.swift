//
//  ApiClientTests.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//
//http://hoangtran.me/ios/testing/2016/09/12/unit-test-network-layer-in-ios/
// https://www.martinfowler.com/bliki/TestDouble.html

import Mockingjay
import Quick
import Nimble

@testable import Pytt

class ApiClientSpec: QuickSpec {
    
    override func spec() {
        super.spec()
    
        
        describe("an api client") {
            var apiClient: ApiClient!
            
            beforeEach {
                apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                                   completionHandlerQueue: OperationQueue.main)
                self.stub(everything, jsonData(self.mockResponseData(), status: 200, headers: nil))
                
            }
            
            describe("fetching and parsing") {
            
                it("is successfull") {
                    waitUntil(timeout: 5) { done in
                        let request = RecipesApiRequest(ingredients: "egal")
                        apiClient.execute(request: request) { (result) in
                            switch result {
                            case let .success(response):
                                do {
                                    let json = try JSONSerialization.jsonObject(with: response.data, options: [])
                                    let recipes = try [Recipe].decode(json)
                                    expect(recipes.count) > 0
                                } catch {
                                    fail("Could not parse response")
                                }
                                break
                            case .failure(_):
                                fail("Expected successful response")
                                break
                            }
                            done()
                        }
                    }
                }
            }
        }
    }

    
    func mockResponseData() -> Data {
        guard let jsonFileUrl = Bundle(for: type(of: self)).url(forResource: "recipeList", withExtension: "json") else {
            preconditionFailure("Could not get mock response file from bundle")
        }
        guard let mockResponseData = try? Data(contentsOf: jsonFileUrl) else {
            preconditionFailure("Could create data from json file")
        }
        return mockResponseData
    }
}
