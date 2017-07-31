//
//  UITableViewCell+Identifier.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Wirecard. All rights reserved.
//

import UIKit

extension ReusableView where Self: UITableViewCell {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {
    
}
