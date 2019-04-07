//
//  EllipseController.swift
//  WesColemanWaveTerrainSynth
//
//  Created by Wesley Coleman on 4/2/18.
//  Copyright © 2018 Wesley Coleman. All rights reserved.
//
import CsoundiOS
import UIKit

class EllipseController: UIViewController {
    
    lazy var csound = (tabBarController as! CsoundTabBarController).csound
    lazy var csoundUI = (tabBarController as! CsoundTabBarController).csoundUI
    
    lazy var maxX = view.bounds.maxX
    lazy var maxY = view.bounds.maxY

    @IBOutlet var resizeView: UIView!
    
    lazy var ellipsePath = UIBezierPath(ovalIn: resizeView.bounds)
    let shapeLayer = CAShapeLayer()
    
    var ellipseHeightPtr: UnsafeMutablePointer<Float>?
    var ellipseWidthPtr: UnsafeMutablePointer<Float>?
    var xcenterPtr: UnsafeMutablePointer<Float>?
    var ycenterPtr: UnsafeMutablePointer<Float>?
    var ellipseHeight: Float = 0.0
    var ellipseWidth: Float = 0.0
    var xcenter: Float = 4.5
    var ycenter: Float = 4.5
    var normYcenter: CGFloat = 0.0
    var normXcenter: CGFloat = 0.0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        csound.addBinding(self)
        
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        view.addGestureRecognizer(pinch)
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        let loc1 = sender.location(ofTouch: 0, in: view)
        let loc2 = sender.location(ofTouch: 1, in: view)
        resizeView.frame.origin = loc1
        resizeView.frame.size.width = loc2.x - loc1.x
        resizeView.frame.size.height = loc2.y - loc1.y
        
        normXcenter = ((loc1.x/maxX) + (loc2.x/maxX)) * 0.5 //x values normalized normalized from 0 to 1
        normYcenter = ((1-(loc1.y/maxY)) + (1-(loc2.y/maxY))) * 0.5 //y values normalized from 0 to 1
        
        xcenter = Float(normXcenter * 8) //times 5 to meet length of xtable
        ycenter = Float(normYcenter * 8) //times 5 to meet length of ytable
        ellipseWidth = Float((loc2.x - loc1.x)/maxX) * 8
        ellipseHeight = Float((loc2.y-loc1.y)/maxY) * 8
        
        func draw(_ rect: CGRect){
            resizeView.layer.addSublayer(shapeLayer)
            ellipsePath = UIBezierPath(ovalIn: resizeView.bounds)
            shapeLayer.path = ellipsePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineWidth = 5.0
            ellipsePath.stroke()
            resizeView.setNeedsDisplay()
        }
        
        draw(resizeView.bounds)
        
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension EllipseController: CsoundVirtualKeyboardDelegate {
    // KeyboardDelegate method called when the key is released
    func keyUp(_ keybd: CsoundVirtualKeyboard, keyNum: Int) {
        let score = String(format: "i-1 0 -1 %d", keyNum+60)
        csound.sendScore(score)
    }
    
    // KeyboardDelegate method called when the key is pressed
    func keyDown(_ keybd: CsoundVirtualKeyboard, keyNum: Int) {
        let score = String(format: "i1 0 -1 %d", keyNum+60)
        csound.sendScore(score)
    }
    
    // Set keyboard delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "keyboard" {
            (segue.destination.view as? CsoundVirtualKeyboard)?.keyboardDelegate = self
        }
    }
}

extension EllipseController: CsoundBinding{
    func setup(_ csoundObj: CsoundObj!) {
        ellipseHeightPtr = csoundObj.getInputChannelPtr("yradius", channelType: CSOUND_CONTROL_CHANNEL)
        ellipseWidthPtr = csoundObj.getInputChannelPtr("xradius", channelType: CSOUND_CONTROL_CHANNEL)
        xcenterPtr = csoundObj.getInputChannelPtr("xcenter", channelType: CSOUND_CONTROL_CHANNEL)
        ycenterPtr = csoundObj.getInputChannelPtr("ycenter", channelType: CSOUND_CONTROL_CHANNEL)
    }
    func updateValuesToCsound() {
        ellipseHeightPtr?.pointee = ellipseHeight
        ellipseWidthPtr?.pointee = ellipseWidth
        xcenterPtr?.pointee = xcenter
        ycenterPtr?.pointee = ycenter
    }
}

