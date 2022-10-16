//
//  ScrollVCViewController.swift
//  AllInOne
//
//  Created by sweta makuwala on 30/06/22.
//

import UIKit

class ScrollVC: UIViewController {

    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    @IBOutlet weak var phoneNumTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if let emailText = emailTxtField.text {
            if emailText.isValidEmail {
                print("valid email address")
            } else {
                print("invalid email address")
            }
        }
        if let passwordText = passwordTxtFld.text {
            if passwordText.isValidPassword {
                print("valid password")
            } else {
                print("invalid password")
            }
        }
        if let phoneText = phoneNumTxtFld.text {
            if phoneText.isValidPhoneNum{
                print("valid phone number")
            } else {
                print("invalid phone number")
            }
        }
    }
}
