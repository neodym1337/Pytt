//
//  UIViewController+Alert.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-24.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import SwiftMessages

extension UIViewController {
    func showError(withMessage message: String) {
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.isHidden = true
        let iconText = ["🤔", "😳", "🙄", "😶"].sm_random()!
        view.configureContent(title: "Oops, something went wrong", body: message, iconText: iconText)
        
        var config = SwiftMessages.Config()
        config.duration = .automatic
        SwiftMessages.show(config: config, view: view)
    }
}
