//
//  SliderCell.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImg: UIImageView!
    
    @IBOutlet weak var shadowView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.cornerRadius = 40
        shadowView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
