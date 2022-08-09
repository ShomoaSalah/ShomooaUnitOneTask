//
//  SliderCell.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit
import FSPagerView

class SliderCell: FSPagerViewCell {

    @IBOutlet weak var sliderImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var item: UIImage! {
        didSet{
            sliderImg.image = item
        }
    }
    
    
    func configure(data: UIImage) {
        self.item = data
    }

}
