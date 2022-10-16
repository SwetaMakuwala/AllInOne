//
//  CamGallaryVc.swift
//  AllInOne
//
//  Created by sweta makuwala on 18/08/22.
//

import UIKit
import AVFoundation
class CamGallaryVc: UIViewController {
    
    @IBOutlet weak var displayImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CameraManager.shared.delegate = self
        
    }
    
    @IBAction func openCamPressed(_ sender: UIButton) {
        //CameraManager.shared.presentCam(vc: self)
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraAuthorizationStatus {
        case .notDetermined:
            requestCameraPermission()
        case .authorized:
            presentCamera()
        case .restricted, .denied:
            Utilities.shared.makeAlertAccessDenied(vc: self)
        }
    }
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
            
            guard accessGranted == true else {
                Utilities.shared.makeAlertAccessDenied(vc: self)
                return
            }
            self.presentCamera()
        })
    }
    
    func presentCamera() {
        DispatchQueue.main.async {
            let photoPicker = UIImagePickerController()
            photoPicker.sourceType = .camera
            photoPicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            
            self.present(photoPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openFileManagerPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self;
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
}

//MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate

extension CamGallaryVc : UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        displayImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension CamGallaryVc : CamManagerDelegate {
    func receivedImage() {
        
    }
    
    
}
