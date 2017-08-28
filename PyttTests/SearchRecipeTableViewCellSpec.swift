//
//  SearchRecipeTableViewCellSpec.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import Pytt

class SearchRecipeTableViewCellSpec: QuickSpec {

    override func spec() {

        beforeSuite {
            setNimbleTolerance(0)
            
        }
        
        context("a cell") { 
            
            it("should be created") {
                
                let cellNib = UINib(nibName: "SearchRecipeTableViewCell", bundle: nil)
                guard let cell = cellNib.instantiate(withOwner: nil, options: nil).first as? SearchRecipesTableViewCellImplementation else {
                    fail("No nib named SearchRecipeTableViewCell")
                    return
                }
                
                cell.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 100))
                
                cell.display(title: "Test title")
                cell.display(rating: 3)
                
                let bundle = Bundle(for: type(of: self))
                guard let image = UIImage(named: "dummyImage.jpg", in: bundle, compatibleWith: nil) else {
                    fail("Could not load image from test bundle")
                    return
                }
                cell.display(image: image)
                
            
//                expect(cell).to(recordDeviceAgnosticSnapshot())
                expect(cell).to(haveValidDeviceAgnosticSnapshot())
            }
        }
    }
}

extension SearchRecipesTableViewCellImplementation {
    
    func display(image: UIImage) {
        foodImageView.image = image
    }
}
