//
//  FrameExtractor.swift
//  Pytt
//
//  Created by Johan Hosk on 31/07/17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//http://reza.codes/2017-07-29/how-to-train-your-own-dataset-for-coreml/
//https://medium.com/ios-os-x-development/ios-camera-frames-extraction-d2c0f80ed05a
// https://github.com/alex-chan/AVCamSwift camera management


//Camera capture configuration, orientation etc
//https://stackoverflow.com/questions/30540857/avcapturevideopreviewlayer-camera-preview-freezes-stuck-after-moving-to-backgr

import CoreImage
import AVFoundation
import UIKit

protocol FrameExtractorUseCaseDelegate:class {
    func captured(image: UIImage)
}

protocol FrameExtractorUseCase {
    init()
    func startCapturing()
    func stopCapturing()
    var videoPreviewView:VideoPreviewView? { get }
}

class FrameExtractorUseCaseImplementation: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, FrameExtractorUseCase {
    
    fileprivate let captureSession = AVCaptureSession()
    fileprivate let context = CIContext()
    fileprivate let sessionQueue = DispatchQueue(label: "session queue")
    fileprivate var permissionGranted = false
    
    fileprivate let mediaType = AVMediaTypeVideo
    fileprivate let deviceTypeBackCamera = AVCaptureDeviceType.builtInWideAngleCamera
    fileprivate let position = AVCaptureDevicePosition.back
    fileprivate let quality = AVCaptureSessionPresetMedium
    
    public weak var delegate:FrameExtractorUseCaseDelegate?
    
    var videoPreviewView: VideoPreviewView?
    
    required override init() {
        super.init()
        startCapturing()
    }
    
    //MARK: - FrameExtractorUseCase
    
    func startCapturing() {
        self.checkPermission()
        sessionQueue.async { [unowned self] in
            self.configureSession()
            self.captureSession.startRunning()
            self.videoPreviewView = VideoPreviewView(session: self.captureSession)
            
            DispatchQueue.main.async {
                self.videoPreviewView?.previewLayer.connection.videoOrientation = UIApplication.shared.statusBarOrientation.videoOrientation!
            }
        }
    }
    
    func stopCapturing() {
        sessionQueue.async { [unowned self] in
            if (self.captureSession.isRunning) {
                self.captureSession.stopRunning()
                self.videoPreviewView = nil
            }
        }
    }
    
    //MARK: - Implementation
    
    private func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) {
        case .authorized:
            //User has explicitly granted permission for media capture
            permissionGranted = true
            break
        case .notDetermined:
            //User has not yet granted or denied permission
            requestPermission()
            break
        default:
            permissionGranted = false
            break
        }
    }
    
    private func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(forMediaType: mediaType, completionHandler: { [unowned self] (granted) in
            self.permissionGranted = true
            self.sessionQueue.resume()
        })
    }
    
      private func configureSession() {
        guard permissionGranted else {
            print("Could not configure session, no permission")
            return
        }
        captureSession.sessionPreset = quality
        guard let captureDevice = selectCaptureDeviec() else {
            print("Could not select capture device")
            return
        }
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: captureDevice) else {
            print("Could not set capture input")
            return
        }
        guard captureSession.canAddInput(captureDeviceInput) else {
            print("Could not add capture input")
            return
        }
        captureSession.addInput(captureDeviceInput)
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sample buffer"))
        
        guard captureSession.canAddOutput(videoOutput) else {
            print("Could not add video output to capture session")
            return
        }
        captureSession.addOutput(videoOutput)
        
        let layer:AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    }
    
    private func selectCaptureDeviec() -> AVCaptureDevice? {
        return AVCaptureDeviceDiscoverySession(deviceTypes: [deviceTypeBackCamera], mediaType: mediaType, position:position).devices.first
    }
    
    //MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        print("Got a frame")
        guard let uiImage = imageFromSampleBuffer(sampleBuffer: sampleBuffer) else { return }
        DispatchQueue.main.async { [unowned self] in
            self.delegate?.captured(image: uiImage)
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didDrop sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {

        print("Dropped a frame")
    }
    
    //MARK: - Image processing
    
    private func imageFromSampleBuffer(sampleBuffer: CMSampleBuffer) -> UIImage? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let ciImage = CIImage(cvPixelBuffer: imageBuffer)
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return nil}
        return UIImage(cgImage: cgImage)
        
    }
}
