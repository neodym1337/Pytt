//
//  ReusableView.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-31.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}
