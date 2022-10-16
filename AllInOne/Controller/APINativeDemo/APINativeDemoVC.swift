//
//  APINativeDemoVC.swift
//  AllInOne
//
//  Created by sweta makuwala on 10/09/22.
//

import UIKit

class APINativeDemoVC: UIViewController {
    let user = User()
    let userForAppBweryCode = DataManagerUserTwo()
    var dataUsingGetUrl = UserDeatailDataArray()
    @IBOutlet weak var myLbl : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userForAppBweryCode.delegate = self
        user.GetUserFromServer()
        user.registerUser()
       // user.postMethod()
        userForAppBweryCode.fetchData()
        
       
    }
    
    
    @IBAction func printGeTURLRequestBtnPressed(_ sender: UIButton){
       // print(user.dataFromGetResponse)
        myLbl.text = user.dataFromGetResponse
    }
    
    @IBAction func printGetUrlBtnPressed(_ sender: UIButton) {
    }
    @IBAction func printPostdataBtnPressed(_ sender : UIButton){
        
    }
    
}
extension APINativeDemoVC : DataManagerDelegate{
    func passData(_ data: UserDeatailDataArray) {
        print("delegate : \(data)")
        dataUsingGetUrl = data
    }
    
    
}
