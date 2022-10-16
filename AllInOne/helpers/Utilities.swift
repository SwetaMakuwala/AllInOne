//
//  File.swift
//  circles UI
//
//  Created by Dhaval Dobariya on 10/08/22.
//

import Foundation
import CoreLocation
import UIKit
class Utilities {
  static let shared = Utilities()
     func makeAlertAllowAccess(alertTitle: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, actionTitle: String, vc: UIViewController) {
        let alert = UIAlertController(title: alertTitle, message: "latitude: \(String(describing: latitude)) \n longitude: \(String(describing: longitude))", preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: { capturedAction in
        } )
        alert.addAction(action)
        vc.present(alert, animated: false, completion: nil)
    }
    
     func makeAlertAccessDenied(vc: UIViewController) {
        let alertController = UIAlertController(title: "Location access is denied", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default) { (UIAlertAction) in
            UIApplication.shared.openURL(NSURL(string: UIApplication.openSettingsURLString)! as URL)
        }
         DispatchQueue.main.async {
             
             alertController.addAction(cancelAction)
             alertController.addAction(settingsAction)
             vc.present(alertController, animated: true, completion: nil)
         }
    }
    
    func makeAlertWithTwoOptions(vc:UIViewController ,title: String, optionOne: String, optionTwo: String, handlerOne: ((UIAlertAction)->Void)?, handlerTwo: ((UIAlertAction)->Void)?) {
       let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
       
       let cancelAction  = UIAlertAction(title: NSLocalizedString(optionOne, comment: ""), style: .cancel, handler: handlerOne)
       let sendAction = UIAlertAction(title: NSLocalizedString(optionTwo, comment: ""), style: .default, handler: handlerTwo)
       
       alertController.addAction(sendAction)
       alertController.addAction(cancelAction)
       vc.present(alertController, animated: true, completion: nil)
   }
}
