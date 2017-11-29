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

struct Skin {
    
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

    var darkTextColor: UIColor {
        return UIColor(hexString: "#4FCEAD")
    }

    var lightTextColor: UIColor {
        return UIColor(hexString: "#4FCEAD")
    }
    
    var headerFont : UIFont {
        return UIFont()
    }
    
    var textAlignment:NSTextAlignment {
        return NSTextAlignment.right
    }
}


struct SkinManager {
    
    static func loadSkin() {
        //1. Load theme from content server, json and assets
        
        //2. Possibly notify app during runtime that new theme is loaded
    }
    
    var currentSkin: Skin {
        //Get from userdefauls serializable
        return Skin()
    }
    
    static func apply() {
        
        //Use UIAppearance when possible - Set UIAppearance
        UISearchBar.appearance().tintColor = currentSkin.lightBackground
        UINavigationBar.appearance().tintColor = currentSkin.lightBackground
        UINavigationBar.appearance().barTintColor = currentSkin.lightBackground
        
        UINavigationBar.appearance().translucent = currentSkin.lightBackground
        UINavigationBar.appearance().barTintColor = currentSkin.lightBackground
        UINavigationBar.appearance().titleTextAttributes = [
            NSForegroundColorAttributeName: currentSkin.lightBackground
        ]
    }
    
}

//Example protocol
protocol Skinable {
    var skin: Skin { get set }
    func applySkin(skin: Skin)
    init(with skin: Skin)
}

//Example base-class where we set up a ui-component group. All CTA buttons have an icon and one label
class CTAButton: UIButton {
    var label:UILabel
    var icon:UIImageView

    //Default init function of a default iOS SDK button
    init() {
        super.init(frame: CGRect.zero)
        //Configure label and icon here
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//Skinnable version of base class, where we map skin to ui. 
class PrimaryCTAButton: CTAButton, Skinable {
    var skin: Skin

    //This function can be extended in future to observe run-time skin change
    func applySkin(skin: Skin) {
        self.skin = skin
        self.backgroundColor = skin.primaryColor
        self.label.textColor = skin.lightTextColor
    }

    required init(with skin: Skin) {
        self.skin = skin
        applySkin(skin: skin)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AlertCTAButton: CTAButton, Skinable {
    var skin: Skin

    func applySkin(skin: Skin) {
        self.skin = skin
        self.backgroundColor = skin.alertColor
        self.label.textColor = skin.darkTextColor
    }

    required init(with skin: Skin) {
        self.skin = skin
        applySkin(skin: skin)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//class SkinableButton: UIButton, Skinable {
//
//    init(theme: Theme) {
//        addThemeListener()
//    }
//
//    func setThemeListener() {
//
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(self.batteryLevelChanged),
//            name: themeChanged,
//            object: nil)
//    }
//}



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
