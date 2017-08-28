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
    
        var apiClient: ApiClient!
        
        beforeSuite {
            apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                    completionHandlerQueue: OperationQueue.main)
        }
        
        describe("an api client") {

            describe("fetching and parsing") {
                
                afterEach {
                    self.removeAllStubs()
                }

                it("is successfull") {

                    self.stub(everything, jsonData(self.mockResponseData(), status: 200, headers: nil))
                    
                    waitUntil(timeout: 5) { done in
                        let request = RecipesApiRequest(withIngredients: "egal")
                        apiClient.execute(request: request) { (result) in
                            switch result {
                            case let .success(result):
                                expect(result).toNot(beNil())
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
        guard let jsonFileUrl = Bundle(for: type(of: self)).url(
                                forResource: "recipeListValid", withExtension: "json") else {
            preconditionFailure("Could not get mock response file from bundle")
        }
        guard let mockResponseData = try? Data(contentsOf: jsonFileUrl) else {
            preconditionFailure("Could create data from json file")
        }
        return mockResponseData
    }
}
