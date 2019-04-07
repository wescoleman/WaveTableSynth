//
//  CsoundTabBarController.swift
//  WesColemanWaveTerrainSynth
//
//  Created by Wesley Coleman on 3/26/18.
//  Copyright © 2018 Wesley Coleman. All rights reserved.
//

import UIKit
import CsoundiOS

class CsoundTabBarController: UITabBarController {

    var csound = SharedInstances.csound
    lazy var csoundUI: CsoundUI = CsoundUI(csoundObj: csound)
 
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let csdPath = Bundle.main.path(forResource: "genoscil", ofType: "csd")
        csound.setMessageCallback(#selector(printMessage(_:)), withListener: self)
        csound.play(csdPath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sample callback function for console output from CsoundObj
    @objc func printMessage(_ infoObj: NSValue) {
        var info = Message()    // Create instance of Message (a C Struct)
        infoObj.getValue(&info) // Store the infoObj value in Message
        let message = UnsafeMutablePointer<Int8>.allocate(capacity: 1024) // Create an empty C-String
        let va_ptr: CVaListPointer = CVaListPointer(_fromUnsafeMutablePointer: &(info.valist)) // Get reference to variable argument list
        vsnprintf(message, 1024, info.format, va_ptr)   // Store in our C-String
        let output = String(cString: message)   // Create String object with C-String
        print(output)
    }
}
