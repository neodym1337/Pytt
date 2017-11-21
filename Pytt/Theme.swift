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

let themeChanged = "themeChangedNotification"

protocol Themeable {
    func applyTheme()
    func setThemeListener()
}

struct Theme {
    
    init() {
        
        
    }
    
    init(json:NSDictionary, assets:NSDictionary) {
        
        //Init with json
        
        //Reference to assets from disk
    }
    
    //Colors
    var primaryColor: UIColor {
        return UIColor(hexString: "#4FCEAD")
    }
    
    var secondaryColor: UIColor {
        return UIColor(hexString: "#4FCEAD")
    }
    
    var alertColor: UIColor {
        return UIColor(hexString: "#4FCEAD")
    }
    
    var headerFont : UIFont {
        return UIFont()
    }
    
    var textAlignment:NSTextAlignment {
        return NSTextAlignment.right
    }
}


struct ThemeManager {
    
    static func loadTheme() {
        //1. Load theme from content server, json and assets
        
        //2. Possibly notify app during runtime that new theme is loaded
    }
    
    static func currentTheme() -> Theme {
        //Get from userdefauls serializable
        return Theme()
    }
    
    static func apply() {
        
        //Use UIAppearance when possible - Set UIAppearance
        UISearchBar.appearance().tintColor = currentTheme().lightBackground
        UINavigationBar.appearance().tintColor = currentTheme().lightBackground
        UINavigationBar.appearance().barTintColor = currentTheme().lightBackground
        
        UINavigationBar.appearance().translucent = currentTheme().lightBackground
        UINavigationBar.appearance().barTintColor = currentTheme().lightBackground
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: currentTheme().lightBackground
        ]
    }
    
}

class ThemableButton: UIButton, Themeable {
    
    init(theme: Theme) {
        addThemeListener()
    }
    
    func setThemeListener() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.batteryLevelChanged),
            name: themeChanged,
            object: nil)
    }
}

class CallToActionButton: ThemableButton {
    
    func applyTheme() {
        backgroundColor = ThemeManager.currentTheme().primaryColor
        titleLabel?.font = ThemeManager.currentTheme().headerFont
        titleLabel?.textAlignment = ThemeManager.currentTheme().textAlignment
    }
}

class LogOutButton: ThemableButton {
    
    func applyTheme() {
        backgroundColor = ThemeManager.currentTheme().alertColor
        titleLabel?.font = ThemeManager.currentTheme().headerFont
    }
}


extension UIColor {
    
    class var theme: UIColor {
        return UIColor(hexString: "#4FCEAD") //On navigation bars button titles, progress indicator
    }
    
    class var border: UIColor {
        
        
        return UIColor(hexString: "#F0B67F") // Hair line separators in between views.
    }
    
    class var shadow: UIColor {
        return UIColor(hexString: "#513C2C") // Shadow colours for card like design.
    }
    
    class var darkBackground: UIColor {
        return UIColor(hexString: "#4FCEAD") // Dark background colour to group UI components with light colour.
    }
    
    class var intermidiateBackground: UIColor {
        return UIColor(hexString: "#4FCEAD") // Used for grouping UI elements with some other colour scheme
    }
    
    class var lightBackground: UIColor {
        return UIColor.white//UIColor(hexString: "#DFF2D8") // Light background colour to group UI components with dark colour.
    }
    
    class var darkText: UIColor {
        return UIColor(hexString: "#513C2C")
    }
    
    class var lightText: UIColor {
        return UIColor(hexString: "#F0B67F")
    }
    
    class var affirmation: UIColor {
        return UIColor(hexString: "#4FCEAD") // Colour to show success, something right for user.
    }
    
    class var failure: UIColor {
        return UIColor(hexString: "#4FCEAD") // Colour to show success, something right for user.
    }
    
    class func custom(hexString: String, _ opacity: Float) -> UIColor {
        return UIColor(hexString: hexString).withAlphaComponent(CGFloat(opacity))
    }
}
