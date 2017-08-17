//
//  Recipe.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//Insp https://medium.com/cocoaacademymag/unit-testing-parsing-a-json-response-b694a1b669ff

import UIKit
import Quick
import Nimble
import SwiftyJSON

@testable import Pytt

class RecipeTest: QuickSpec {
    
    func validJsonData() -> Data {
        guard let jsonFileUrl = Bundle(for: type(of: self)).url(forResource: "recipe", withExtension: "json") else {
            preconditionFailure("Could not get mock response file from bundle")
        }
        guard let mockResponseData = try? Data(contentsOf: jsonFileUrl) else {
            preconditionFailure("Could create data from json file")
        }
        return mockResponseData
    }

    
    override func spec() {
        describe("Recipe") {
            var recipe: Recipe!
            var data: Data = validJsonData()
        
            
            it("Should parse all properties") {
                let json = JSON(data: data)
                recipe = ApiRecipe(json: json).recipe
                
                print("TEST ------")
                print(recipe)
                
                expect(recipe.title) == "Bacon Wrapped Jalapeno Popper Stuffed Chicken"
                expect(recipe.id) == "35120"
                expect(recipe.imageUrl) == "http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg"
                expect(recipe.sourceUrl) == "http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html"
                expect(recipe.rank) == 100
                
            }
        
        }
    }
}
