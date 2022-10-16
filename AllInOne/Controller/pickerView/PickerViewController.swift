//
//  PickerViewController.swift
//  AllInOne
//
//  Created by sweta makuwala on 17/08/22.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    var pickerView = UIPickerView()
    var hour = 0
    var minute = 0
    var second = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        pickerView.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: 35))
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.done))
        toolBar.setItems([button], animated: true)
        textField.inputAccessoryView = toolBar
        textField.inputView = pickerView
    }
    
    
    @objc func done() {
        view.endEditing(true)
        textField.text = "\(hour)H:\(minute)M:\(second)S"
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.selectRow(0, inComponent: 1, animated: false)
        pickerView.selectRow(0, inComponent: 2, animated: false)
        
    }
    
}
//MARK: - pickerview delegate and data source
extension PickerViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0 :
            return 24
        case 1, 2:
            return 60
        default :
            return 0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0 :
            return  "\(row) hour"
        case 1:
            return  "\(row) minute"
        case 2:
            return  "\(row) second"
        default :
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0 :
            hour = row
        case 1:
            minute = row
        case 2:
            second = row
        default :
            break
        }
       
    }
}

//MARK: - textFieldDelegate and data source :

extension PickerViewController  : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        
    }
}
