//
//  CapturePresenter.swift
//  Pytt
//
//  Created by Johan Hosk on 31/07/17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//



import UIKit

protocol CaptureView: class {
    func identifiedObject(object:String)
    func failedToIdentifyObject(message:String)
}

protocol CapturePresenter {
    
//    var numberOfRecipes: Int { get }
}

class CapturePresenterImplementation: CapturePresenter {
    fileprivate weak var view: CaptureView?
    fileprivate let frameExtractorUseCase:FrameExtractorUseCaseImplementation
    
    
    internal let router:CaptureRouter
    
    fileprivate var currentImage:UIImage? {
        didSet {
            guard let image = currentImage else { return }
            
        }
    }
    
    init(view:CaptureView,
         frameExtractorUseCase: FrameExtractorUseCaseImplementation,
         router: CaptureRouter) {
        self.view = view
        self.frameExtractorUseCase = frameExtractorUseCase
        self.router = router
    }
    
    func viewDidLoad() {
        //reguster cell
        
    }

    
}
