//
//  ViewController.swift
//  WesColemanWaveTerrainSynth
//
//  Created by Wesley Coleman on 3/22/18.
//  Copyright © 2018 Wesley Coleman. All rights reserved.
//

import UIKit
import CsoundiOS

class ViewController: UIViewController {
    
    lazy var csound = (tabBarController as! CsoundTabBarController).csound
    lazy var csoundUI = (tabBarController as! CsoundTabBarController).csoundUI
    

    
    @IBOutlet var waveOneSlider: UISlider!
    @IBOutlet var waveTwoSlider: UISlider!
    @IBOutlet var waveThreeSlider: UISlider!
    @IBOutlet var waveFourSlider: UISlider!
    @IBOutlet var waveFiveSlider: UISlider!
    
    @IBOutlet var yWaveOne: UISlider!
    @IBOutlet var yWaveTwo: UISlider!
    @IBOutlet var yWaveThree: UISlider!
    @IBOutlet var yWaveFour: UISlider!
    @IBOutlet var yWaveFive: UISlider!
    
    @IBOutlet var xStack: UIStackView!
    
    override func viewDidLoad() {

        csoundUI.add(waveOneSlider, forChannelName: "xwave1")
        csoundUI.add(waveTwoSlider, forChannelName: "xwave2")
        csoundUI.add(waveThreeSlider, forChannelName: "xwave3")
        csoundUI.add(waveFourSlider, forChannelName: "xwave4")
        csoundUI.add(waveFiveSlider, forChannelName: "xwave5")
        
        csoundUI.add(yWaveOne, forChannelName: "ywave1")
        csoundUI.add(yWaveTwo, forChannelName: "ywave2")
        csoundUI.add(yWaveThree, forChannelName: "ywave3")
        csoundUI.add(yWaveFour, forChannelName: "ywave4")
        csoundUI.add(yWaveFive, forChannelName: "ywave5")
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func playNote(_ sender: UIButton) {
        csound.sendScore("i1 0 3 440")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: CsoundVirtualKeyboardDelegate {
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

