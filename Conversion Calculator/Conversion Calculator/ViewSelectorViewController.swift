//
//  ViewSelectorViewController.swift
//  Conversion Calculator
//
//  Created by Xcode User on 9/23/19.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit
protocol ViceSelectionViewControllerDelegate {
   func indicateSelection(vice: String)
}

class ViewSelectorViewController: UIViewController {

    var pickerData:[String] = [String]()
    var selection:String = "Steak"
    var mode : CalculatorMode?
    var delegate: ViceSelectionViewControllerDelegate?
    @IBOutlet weak var fromUnitButton: UIButton!
    @IBOutlet weak var toUnitButton: UIButton!
    
    var fromLenUnit: LengthUnit?
    var toLenUnit: LengthUnit?
    var fromVolUnit: VolumeUnit?
    var toVolUnit: VolumeUnit?
    
    @IBAction func saveButton(_ sender:UIBarButtonItem){
        
    }
    
    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(mode == .Length){
        self.pickerData = ["Meters", "Yards", "Miles"]
        }
        else{
            self.pickerData = ["Liters", "Gallons", "Quarts"]
        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
//        self.unitPicker.isHidden = true
        
        if let d = self.delegate{
            if mode == .Length{
                d.indicateSelection(fromUnits: LengthUnit(rawValue: fromLenUnit.text!)!, toUnits: LengthUnit(rawValue: toLenUnit.text!)!)
            }
            else{
                d.indicateSelection(fromUnits: VolumeUnit(rawValue: fromVolUnit.text!)!, toUnits: VolumeUnit(rawValue: toVolUnit.text!)!)
            }
        }
    }

   

    extension ViceSelectionViewControllerDelegate: UIPickerViewDataSource, UIPickerViewDelegate{
        func numberOfComponents(in: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
            return pickerData.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.pickerData[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.choice = self.pickerData[row]
        }
    }
    
}
