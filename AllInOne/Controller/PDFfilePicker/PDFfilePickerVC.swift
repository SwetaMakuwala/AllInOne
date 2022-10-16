//
//  PDFfilePickerVC.swift
//  AllInOne
//
//  Created by sweta makuwala on 28/08/22.
//

import UIKit

class PDFfilePickerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectPDFPressed(_ sender: UIButton) {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            // process files
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }    }
    
}
