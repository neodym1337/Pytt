//
//  VideoPreviewView.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-08-01.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPreviewView: UIView {
    
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    convenience init(session: AVCaptureSession) {
        self.init(frame: CGRect.zero)
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        self.layer.addSublayer(self.previewLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer.frame = self.bounds
    }
}
