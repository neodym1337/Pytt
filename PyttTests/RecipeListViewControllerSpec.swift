//
//  RecipeListViewController.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-24.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots
import Mockingjay

@testable import Pytt

//UI-testing
//https://medium.com/@dasdom/testing-the-user-interface-with-fbsnapshottestcase-420b15032562
//http://cleanswifter.com/writing-first-fbsnapshottestcase/

class RecipeListViewControllerSpec: QuickSpec {

    override func spec() {
        
        
        describe("context") {
            beforeEach {
                setNimbleTolerance(0)
                setNimbleTestFolder("tests")
                
                self.stub(everything, jsonData(self.mockResponseData(), status: 200, headers: nil))

            }
            
            it("it should have a correct title") {
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(
                                    withIdentifier: "RecipeListViewController") as! RecipeListViewController
                let view = viewController.view
                
                
                
                
                waitUntil(timeout: 5, action: { (done) in
                    expect(view).to(recordDeviceAgnosticSnapshot())
                    //expect(view).to(haveValidDeviceAgnosticSnapshot())
                    done()
                })
                
            }
            
            
            it("should have correct cell") {
                //Test UITableViewCell here
                
                //let cell = SearchRecipesTableViewCell();
                
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
    
    func mockPresenters() {
        
    }

    
}
