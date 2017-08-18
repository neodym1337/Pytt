//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//Insp https://medium.com/cocoaacademymag/unit-testing-parsing-a-json-response-b694a1b669ff

//error handling http://jayeshkawli.ghost.io/try-catch-blocks-and-unit-tests-in-swift-3-0/

import UIKit
import Quick
import Nimble

@testable import Pytt

class RecipeTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("a recipe") {
            
            var json:Any!
            
            beforeEach {

            }

            describe("parsing") {
                
                it("should exist") {
                    
                    let recipe = try! Recipe.decode(json)
                    
                    expect(recipe).toNot(beNil())
                }
                
                it("should parse all properties correctly") {
                    let recipe = try! Recipe.decode(json)
                    
                    expect(recipe.title) == "Bacon Wrapped Jalapeno Popper Stuffed Chicken"
                    expect(recipe.id) == "35120"
                    expect(recipe.imageUrl) == "http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg"
                    expect(recipe.sourceUrl) == "http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html"
                    expect(recipe.rank) == 100
                }
                
                it("should parse wrong for missing title") {
                    let recipe = try! Recipe.decode(json)
                    
                    expect(recipe.title) == "Bacon Wrapped Jalapeno Popper Stuffed Chicken"
                    expect(recipe.id) == "35120"
                    expect(recipe.imageUrl) == "http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg"
                    expect(recipe.sourceUrl) == "http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html"
                    expect(recipe.rank) == 100
                }

            }
        }
    }
    
//    do {
//    let jsonFileUrl = Bundle(for: type(of: self)).url(forResource: "recipe", withExtension: "json")!
//    let data = try Data(contentsOf: jsonFileUrl)
//    json = try JSONSerialization.jsonObject(with: data, options: [])
//    } catch {
//    fail("Could not parse mock data")
//    }
    
    
    //Bundle Bundle(for: type(of: self))
    
    func json(withFilename fileName: String) throws -> Any {
        do {
            let json = try JSONSerialization.jsonObject(withFilename: fileName, in: Bundle(for: type(of: self)))
            return json
        } catch {
            throw error
        }
    }
    
    func validJson() -> Any {
        //json(with: <#T##String#>)
    }
    
    func invalidJsonNoTitle() -> Any {
        //return JSONSerialization.jsonObject(with: "recipeNoTitle", in: Bundle(for: type(of: self)))
    }
    
    
}




