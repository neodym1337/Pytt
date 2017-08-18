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
import Decodable

@testable import Pytt

class RecipeTest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("a recipe") {
            

            describe("parsing") {
                
                it("should parse") {
                    
                    guard let json = self.json(withFilename: "recipeValid"),
                    let recipe = try? Recipe.decode(json) else {
                        fail("Could not parse json")
                        return
                    }
                    
                    expect(recipe).toNot(beNil())
                }
                
                it("should parse all properties correctly") {
                    guard let json = self.json(withFilename: "recipeValid"),
                        let recipe = try? Recipe.decode(json) else {
                            fail("Could not parse json")
                            return
                    }
                    
                    expect(recipe.title) == "Bacon Wrapped Jalapeno Popper Stuffed Chicken"
                    expect(recipe.id) == "35120"
                    expect(recipe.imageUrl) == "http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg"
                    expect(recipe.sourceUrl) ==
                    "http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html"
                    expect(recipe.rank) == 100
                }
                
                it("should fail when parsing title") {
                    guard let json = self.json(withFilename: "recipeValid") else {
                        fail("Could not get json")
                        return
                    }
                    //Fix error matching https://github.com/Quick/Nimble
                    expect { try Recipe.decode(json)}.to(throwError(throwError(_, errorType: nil, closure: nil)))
                }

                
            }
        }
    }
    
    func parseJson(withFilename fileName: String) throws -> Any {
        do {
            let json = try JSONSerialization.jsonObject(withFilename: fileName, in: Bundle(for: type(of: self)))
            return json
        } catch {
            throw error
        }
    }
    
    func json(withFilename fileName: String) -> Any? {
        guard let json = try? parseJson(withFilename: "recipeValid") else {
            fail("Could not parse valid recipe json")
            return nil
        }
        return json
    }
    

}




