//
//  ColorScheme.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//http://blog.visme.co/website-color-schemes/ schemes
//more schems http://blog.visme.co/color-combinations/
//https://www.vecteezy.com/vector-art/82080-free-fast-food-vector-icons icons
//Theming https://medium.com/swift-programming/styling-your-ios-application-using-chameleon-with-the-reusable-stylemanager-in-swift-7d56dc48547a


import UIKit


struct Color {
    
    static let theme = UIColor(hexString: "#4FCEAD") //On navigation bars button titles, progress indicator
    static let border = UIColor(hexString: "#F0B67F") // Hair line separators in between views.
    static let shadow = UIColor(hexString: "#513C2C") // Shadow colours for card like design.
    static let darkBackground = UIColor(hexString: "#4FCEAD") // Dark background colour to group UI components with light colour.
    static let intermidiateBackground = UIColor(hexString: "#4FCEAD") // Used for grouping UI elements with some other colour scheme.
    static let lightBackground = UIColor(hexString: "#DFF2D8") // Light background colour to group UI components with dark colour.
    static let darkText = UIColor(hexString: "#513C2C")
    static let lightText = UIColor(hexString: "#F0B67F")
    static let affirmation = UIColor(hexString: "#4FCEAD") // Colour to show success, something right for user.
    
    func custom(hexString:String, _ opacity:Float) -> UIColor {
        return UIColor(hexString: hexString).withAlphaComponent(CGFloat(opacity))
    }
    
}
