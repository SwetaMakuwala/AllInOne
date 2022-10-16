//
//  SegmentViewController.swift
//  AllInOne
//
//  Created by sweta makuwala on 12/07/22.
//

import UIKit

class SegmentVC: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var viewToChangeColor: UIView!
    
    enum ColorSelection : Int {
        case red = 0
        case green
        case blue
        case black
        
        func getTheTitle() -> String {
            switch self {
            case .red:
                return "Red"
            case .green:
                return "Green"
            case .blue:
                return "Blue"
            case .black:
                return "Black"
            }
        }
    }
    
    var selectedColorType: ColorSelection = .red
    var segmentTypes : [ColorSelection] = [.red , .green, .blue, .black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = .red
        
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            viewToChangeColor.backgroundColor = .red
            segmentControl.backgroundColor = .red
        case 1:
            viewToChangeColor.backgroundColor = .green
            segmentControl.backgroundColor = .green
        case 2:
            viewToChangeColor.backgroundColor = .blue
            segmentControl.backgroundColor = .blue
        case 3:
            viewToChangeColor.backgroundColor = .black
            segmentControl.backgroundColor = .black
        default :
            break
        }
    }
}
