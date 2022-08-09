//
//  ProfileVC.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit

class ProfileVC: BaseVC {

    @IBOutlet weak var containeerImagee: UIImageView!
    @IBOutlet weak var containnerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        containnerView.setRounded()
        containnerView.clipsToBounds = true
        containeerImagee.setRounded()
        containeerImagee.clipsToBounds = true
    }

}
