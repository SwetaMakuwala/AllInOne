//
//  uiViewCoontroller.swift
//  AllInOne
//
//  Created by sweta makuwala on 03/07/22.
//

import Foundation
import UIKit
extension UIViewController {
    class func loadController() -> Self {
        return instantiateViewControllerFromMainStoryBoard()
    }
    private class func instantiateViewControllerFromMainStoryBoard<T>() -> T {
        let controller = UIStoryboard.mainStoryBoard().instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}

extension UIStoryboard{
    class func mainStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
