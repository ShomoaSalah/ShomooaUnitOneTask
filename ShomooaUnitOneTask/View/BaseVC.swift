//
//  BaseVC.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientColor()
    }
    

    func setGradientColor() {
        let gradient = CAGradientLayer()

        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]

        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
