//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Xcode User on 9/18/19.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var fromInputFied: DecimalMinusTextField!
    @IBOutlet weak var toInputField: DecimalMinusTextField!
    var mode = CalculatorMode.Length;
    var fromLenUnit = LengthUnit.Yards
    var toLenUnit = LengthUnit.Meters
    var fromVolUnit = VolumeUnit.Liters
    var toVolUnit = VolumeUnit.Gallons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let detectTouch = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
    }

    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    
    @IBAction func clearButtonTap(_ sender: UIButton) {
        self.fromInputFied.text = ""
        self.toInputField.text = ""
    }


    @IBAction func calButton(_ sender: UIButton) {
        var fromDouble = (self.fromInputFied.text as! NSString).doubleValue
        var toDouble = (self.toInputField.text as! NSString).doubleValue
        if(self.mode == .Length){
            if(self.fromInputFied.text != ""){
                  let convKey =  LengthConversionKey(toUnits: toLenUnit, fromUnits: fromLenUnit)
                  toDouble = fromDouble * lengthConversionTable[convKey]!;
                 self.toInputField.text = String(toDouble)
            }else if(self.toInputField.text != ""){
                let convKey =  LengthConversionKey(toUnits: fromLenUnit, fromUnits: toLenUnit)
               fromDouble = toDouble * lengthConversionTable[convKey]!;
                self.fromInputFied.text = String(fromDouble)
            }
        }else{
            if(self.fromInputFied.text != ""){
                let convKey =  VolumeConversionKey(toUnits: toVolUnit, fromUnits: fromVolUnit)
                 toDouble = fromDouble * volumeConversionTable[convKey]!;
                self.toInputField.text = String(toDouble)
            }else if(self.toInputField.text != ""){
                let convKey =  VolumeConversionKey(toUnits: fromVolUnit, fromUnits: toVolUnit)
                 fromDouble = toDouble * volumeConversionTable[convKey]!;
                self.fromInputFied.text = String(fromDouble)
            }
            }

        }
    func indicateSelection(fromUnits: LengthUnit, toUnits: LengthUnit) {
        
            self.toLenUnit = toUnits
            self.fromLenUnit = fromUnits
            fromInputFied.placeholder = "Enter a length in \(self.fromLenUnit)"
            toInputField.placeholder = "Enter a length in \(self.toLenUnit)"
            fromLabel.text = "\(self.fromLenUnit)"
            toLabel.text = "\(self.toLenUnit)"
        
    }
    
    func indicateSelection(fromUnits: VolumeUnit, toUnits: VolumeUnit) {
        
        self.toVolUnit = toUnits
        self.fromVolUnit = fromUnits
        fromInputFied.placeholder = "Enter a length in \(self.fromLenUnit)"
        toInputField.placeholder = "Enter a length in \(self.toLenUnit)"
        fromLabel.text = "\(self.fromLenUnit)"
        toLabel.text = "\(self.toLenUnit)"
        
    }
    
    
    
//        @IBAction func modeButton(_ sender: UIButton) {
//            if (mode == .Length){
//                self.fromLabel.text! = "\(self.fromVol)"
//                self.toLabel.text! = "\(self.toVol)"
//                fromInput.placeholder = "Enter a Volume in \(self.fromVol)"
//                toInput.placeholder = "Enter a Volume in \(self.toVol)"
//                mode = CalculatorMode.Volume
//            }
//    }
//
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setting"{
        
        if let target = segue.destination.children[0] as? ViewSelectorViewController{
            target.delegate = self
            target.mode = self.mode
            target.fromLenUnit = self.fromLenUnit
            target.toLenUnit = self.toLenUnit
            target.fromVolUnit = self.fromVolUnit
            target.toVolUnit = self.toVolUnit
        }
    }
    }

    
    }



