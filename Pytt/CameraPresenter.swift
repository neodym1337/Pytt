//
//  CapturePresenter.swift
//  Pytt
//
//  Created by Johan Hosk on 31/07/17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

// http://reza.codes/2017-07-29/how-to-train-your-own-dataset-for-coreml/


import UIKit

protocol CaptureView: class {
    func identifiedObject(object: String)
    func failedToIdentifyObject(message: String)
}

protocol CapturePresenter {
    //Things that have to be accessed outside of presenter
}

class CapturePresenterImplementation: CapturePresenter/*, FrameExtractorUseCaseDelegate*/ {
    fileprivate weak var view: CaptureView?
    //fileprivate let frameExtractorUseCase: FrameExtractorUseCaseImplementation
    
    
    internal let router: CaptureRouter
    
    fileprivate var currentImage: UIImage? {
        didSet {
            guard let image = currentImage else { return }
            print(image)
            //detect image here
        }
    }
    
    init(view: CaptureView/*,
         frameExtractorUseCase: FrameExtractorUseCaseImplementation*/,
         router: CaptureRouter) {
        self.view = view
        //self.frameExtractorUseCase = frameExtractorUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
    
    func captured(image: UIImage) {
        currentImage = image
    }

}
