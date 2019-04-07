//
//  EffectsViewController.swift
//  WesColemanWaveTerrainSynth
//
//  Created by Wesley Coleman on 3/26/18.
//  Copyright © 2018 Wesley Coleman. All rights reserved.
//

import UIKit
import CsoundiOS

class EffectsViewController: UIViewController {
    
    let tablenum = Array(0...4)
    
    @IBOutlet var reverbSlider: UISlider!
    @IBOutlet var panningSlider: UISlider!
    
    @IBOutlet var lfo1Cps: UISlider!
    @IBOutlet var lfo2Cps: UISlider!
    @IBOutlet var lfo3Cps: UISlider!
    @IBOutlet var lfo4Cps: UISlider!
    @IBOutlet var lfo5Cps: UISlider!
    
    @IBOutlet var lfo1Lvl: UISlider!
    @IBOutlet var lfo2Lvl: UISlider!
    @IBOutlet var lfo3Lvl: UISlider!
    @IBOutlet var lfo4Lvl: UISlider!
    @IBOutlet var lfo5Lvl: UISlider!
    
    @IBOutlet var lfoPicker1: UIPickerView!
    @IBOutlet var lfoPicker2: UIPickerView!
    @IBOutlet var lfoPicker3: UIPickerView!
    @IBOutlet var lfoPicker4: UIPickerView!
    @IBOutlet var lfoPicker5: UIPickerView!
    
    var picker1Pointer: UnsafeMutablePointer<Float>?
    var picker1: Float = 0.0
    var picker2Pointer: UnsafeMutablePointer<Float>?
    var picker2: Float = 0.0
    var picker3Pointer: UnsafeMutablePointer<Float>?
    var picker3: Float = 0.0
    var picker4Pointer: UnsafeMutablePointer<Float>?
    var picker4: Float = 0.0
    var picker5Pointer: UnsafeMutablePointer<Float>?
    var picker5: Float = 0.0
   
    
    lazy var csound = (tabBarController as! CsoundTabBarController).csound
    lazy var csoundUI = (tabBarController as! CsoundTabBarController).csoundUI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        csoundUI.add(reverbSlider, forChannelName: "verbsend")
        csoundUI.add(panningSlider, forChannelName: "waveTerrainPan")
        
        csoundUI.add(lfo1Cps, forChannelName: "lfocps1")
        csoundUI.add(lfo2Cps, forChannelName: "lfocps2")
        csoundUI.add(lfo3Cps, forChannelName: "lfocps3")
        csoundUI.add(lfo4Cps, forChannelName: "lfocps4")
        csoundUI.add(lfo5Cps, forChannelName: "lfocps5")
        
        csoundUI.add(lfo1Lvl, forChannelName: "lfoOneLevel")
        csoundUI.add(lfo2Lvl, forChannelName: "lfoTwoLevel")
        csoundUI.add(lfo3Lvl, forChannelName: "lfoThreeLevel")
        csoundUI.add(lfo4Lvl, forChannelName: "lfoFourLevel")
        csoundUI.add(lfo5Lvl, forChannelName: "lfoFiveLevel")
        
        
        lfoPicker1.delegate = self
        lfoPicker1.dataSource = self
        lfoPicker2.delegate = self
        lfoPicker2.dataSource = self
        lfoPicker3.delegate = self
        lfoPicker3.dataSource = self
        lfoPicker4.delegate = self
        lfoPicker4.dataSource = self
        lfoPicker5.delegate = self
        lfoPicker5.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EffectsViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "wtslider \((tablenum[row])+1)"
    }
    
    func pickerView(lfoPicker1: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picker1 = Float(row)
    }
    func pickerView(lfoPicker2: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picker2 = Float(row)
    }
    func pickerView(lfoPicker3: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picker3 = Float(row)
    }
    func pickerView(lfoPicker4: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picker4 = Float(row)
    }
    func pickerView(lfoPicker5: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picker5 = Float(row)
    }
    
}

extension EffectsViewController: CsoundBinding {
    func setup(_ csoundObj: CsoundObj) {
        // Setup channel pointers for manual Csound binding
        picker1Pointer = csoundObj.getInputChannelPtr("lfopicker1", channelType: CSOUND_CONTROL_CHANNEL)
        picker2Pointer = csoundObj.getInputChannelPtr("lfopicker2", channelType: CSOUND_CONTROL_CHANNEL)
        picker3Pointer = csoundObj.getInputChannelPtr("lfopicker3", channelType: CSOUND_CONTROL_CHANNEL)
        picker4Pointer = csoundObj.getInputChannelPtr("lfopicker4", channelType: CSOUND_CONTROL_CHANNEL)
        picker5Pointer = csoundObj.getInputChannelPtr("lfopicker5", channelType: CSOUND_CONTROL_CHANNEL)
    }
    
    func updateValuesToCsound() {
        // Update values at channel pointer addresses
        picker1Pointer?.pointee = picker1
        picker2Pointer?.pointee = picker2
        picker3Pointer?.pointee = picker3
        picker4Pointer?.pointee = picker4
        picker5Pointer?.pointee = picker5
    }
}
