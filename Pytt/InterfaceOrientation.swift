//
//  InterfaceOrientation.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-01.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension UIDeviceOrientation {
    var videoOrientation: AVCaptureVideoOrientation? {
        // Unlike UIInterfaceOrientation, the UIDeviceOrientation has reversed landscape left/right. Doh!
        switch self {
        case .portraitUpsideDown: return .portraitUpsideDown
        case .landscapeRight: return .landscapeLeft
        case .landscapeLeft: return .landscapeRight
        case .portrait: return .portrait
        default: return nil
        }
    }
}

extension UIInterfaceOrientation {
    var videoOrientation: AVCaptureVideoOrientation? {
        switch self {
        case .portraitUpsideDown: return .portraitUpsideDown
        case .landscapeRight: return .landscapeRight
        case .landscapeLeft: return .landscapeLeft
        case .portrait: return .portrait
        default: return nil
        }
    }
}
