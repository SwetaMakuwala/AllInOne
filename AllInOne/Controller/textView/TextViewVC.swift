//
//  TextViewVC.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 28/06/22.
//



import UIKit

class TextViewVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    var bottomHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
   
    func setUp() {
        // delegates and data source
        textView.delegate = self
        print("height constraint: \(heightConstraint.constant)")
        bottomHeight  = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
        print("bottom: \(bottomHeight)")
        adjustTextViewHeight()
    }
    
    func adjustTextViewHeight() {
        let newSize = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: UIScreen.main.bounds.height))
        let heightOfScreen = UIScreen.main.bounds.height
        let heightOfStatusbar = UIApplication.shared.statusBarFrame.height
        let heightOfNavigationBar = self.navigationController?.navigationBar.frame.size.height ?? 0
        let heightOfBottom = bottomHeight
        let safeAreaHeight = heightOfScreen - heightOfStatusbar -  heightOfNavigationBar - heightOfBottom
        // 40 is padded to set for top constraint
        let maxHeight = safeAreaHeight - 40
        
        heightConstraint.constant = newSize.height > maxHeight ? maxHeight : newSize.height
//        print("height of statusbar : \(heightOfStatusbar)")
//        print("height of navigation bar: \(heightOfNavigationBar)")
//        print("bottom height : \(view.safeAreaInsets.bottom)")
//        print("safeAreaHeight : \(safeAreaHeight)")
//        print("maxHeight: \(maxHeight)")
//        print("heightConstraint constant : \(heightConstraint.constant)")
//        print("height of screen: \(heightOfScreen)")
    }
}
extension TextViewVC : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
         adjustTextViewHeight()
    }
    
}

