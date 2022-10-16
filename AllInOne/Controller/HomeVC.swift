//
//  HomeVC.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 28/06/22.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textViewDemoPressed(_ sender: UIButton) {
   
        let vc = TextViewVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
//        if let vc = (storyboard?.instantiateViewController(withIdentifier: Constant.TextViewVC)) as? TextViewVC {
//            self.navigationController?.pushViewController(vc, animated: false)
//        }
    }
    
    @IBAction func tableViewApiCoreDataBtnPressed(_ sender: UIButton) {
        
        let vc = UserTableVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func tableSectionHeaderFooterPressed(_ sender: UIButton) {
        let vc = TableSectionHeaderFooter.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    @IBAction func ScrollViewButtonPressed(_ sender: UIButton) {

        let vc = ScrollVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func segmentControlBtnPressed(_ sender: UIButton) {
        let vc = SegmentVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func chatScreenBtnPressed(_ sender: UIButton) {
        let vc = ChatVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func pickerViewBtnPressed(_ sender: UIButton) {
        let vc = PickerViewController.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func camGallaryPressed(_ sender: UIButton) {
        let vc = CamGallaryVc.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func piCkPDFBtnPressed(_ sender: UIButton) {
        let vc = PDFfilePickerVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    @IBAction func apiNativeGetPostPressed(_ sender: UIButton) {
        let vc = APINativeDemoVC.loadController()
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
}
