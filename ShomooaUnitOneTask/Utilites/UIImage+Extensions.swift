//
//  UIImage+Extensions.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import Foundation
import UIKit

extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: size.height - lineWidth, width: size.width, height: lineWidth))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return image
    }
}


