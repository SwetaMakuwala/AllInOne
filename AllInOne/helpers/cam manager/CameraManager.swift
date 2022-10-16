//
//  CameraManager.swift
//  AllInOne
//
//  Created by sweta makuwala on 19/08/22.
//

import Foundation
import UIKit
//protocol CameraImageDelegate : AnyObject {
//    func receivedImage(image: UIImage)
//}
protocol CamManagerDelegate : AnyObject {
    func receivedImage()
}
class CameraManager: NSObject {
    static let shared = CameraManager()
    var delegate : CamManagerDelegate?
    
    func presentCam(vc: UIViewController){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = vc as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePickerController.sourceType = .camera
            vc.present(imagePickerController, animated: false, completion: nil)
            
        }
    }
}
