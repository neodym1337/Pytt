//
//  ColorScheme.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//http://blog.visme.co/website-color-schemes/ schemes
//https://www.vecteezy.com/vector-art/82080-free-fast-food-vector-icons icons



import UIKit

extension Color {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .border:
            instanceColor = UIColor(hexString: "#F0B67F")
            
        case .theme:
            instanceColor = UIColor(hexString: "#4FCEAD")
            
        case .shadow:
            instanceColor = UIColor(hexString: "#513C2C")
            
        case .darkBackground:
            instanceColor = UIColor(hexString: "#4FCEAD")
            
        case .lightBackground:
            instanceColor = UIColor(hexString: "#DFF2D8")
            
        case .intermidiateBackground:
            instanceColor = UIColor(hexString: "#4FCEAD")
            
        case .darkText:
            instanceColor = UIColor(hexString: "#513C2C")
            
        case .intermidiateText:
            instanceColor = UIColor(hexString: "#F0B67F")
            
        case .lightText:
            instanceColor = UIColor(hexString: "#F0B67F")
            
        case .affirmation:
            instanceColor = UIColor(hexString: "#4FCEAD")
            
        case .negation:
            instanceColor = UIColor(hexString: "#FE5F55")
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
}
