//
//  ApiClientTests.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-03.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import XCTest
import SwiftyJSON
import Mockingjay
import Quick
import Nimble

@testable import Pytt

class ApiClientTest: XCTestCase {
    // https://www.martinfowler.com/bliki/TestDouble.html
    
    var apiClient: ApiClientImplementation!
    
    override func setUp() {
        super.setUp()
        apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
    }
    
    func test_execute_successful_http_response_parse_ok() {
        
        stub(everything, jsonData(mockResponseData(), status: 200, headers: nil))
        
        describe("It shhould fetch recipes and parse them") { 
            waitUntil(timeout: 5) { done in
                let request = RecipesApiRequest(ingredients: "egal")
                self.apiClient.execute(request: request) { (result) in
                    switch result {
                    case let .success(response):
                        expect(response.json["recipes"].array).toNot(beNil())
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
    
    override func tearDown() {
        removeAllStubs()
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
