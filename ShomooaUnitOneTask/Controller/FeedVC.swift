//
//  FeedVC.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit
import TYCyclePagerView


class FeedVC: BaseVC {
    
    @IBOutlet weak var containeerImagee: UIImageView!
    @IBOutlet weak var containnerView: UIView!
    
    @IBOutlet weak var personImgContainer: UIView!
    @IBOutlet weak var personImag: UIImageView!
    
    @IBOutlet weak var slider: TYCyclePagerView! {
        didSet {
            setSliderUI()
        }
    }
    
    func setSliderUI(){
        
        slider.dataSource = self
        slider.delegate = self
        
        slider.isInfiniteLoop = true
        slider.autoScrollInterval = 3.0
        
        
        slider.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: "SliderCell")
        
        slider.layout.itemSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height )

        slider.layout.layoutType = .linear
        slider.layer.backgroundColor = UIColor.clear.cgColor
        slider.backgroundColor = .clear
        slider.layout.itemSpacing = CGFloat(15)
//        slider.layout.minimumScale = 1
        slider.layout.itemHorizontalCenter = true
        slider.setNeedUpdateLayout()
        
    }
    
    let sliderImages = [UIImage(systemName: "moon.zzz"),
                        UIImage(systemName: "sun.min.fill"),
                        UIImage(systemName: "lightbulb")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    
    func setUI() {
        
        let tabBar = self.tabBarController!.tabBar
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.red, size: CGSize(width: 85, height: tabBar.frame.height), lineWidth: 2.0)
        
        containnerView.setRounded()
        containnerView.clipsToBounds = true
        containeerImagee.setRounded()
        containeerImagee.clipsToBounds = true
        
        personImgContainer.setRounded()
        personImgContainer.clipsToBounds = true
        personImag.setRounded()
        personImag.clipsToBounds = true
        
    }
    
}

//MARK: - Pager View DataSource & Delegate

extension FeedVC: TYCyclePagerViewDataSource, TYCyclePagerViewDelegate {
    
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return sliderImages.count
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        //
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = CGSize(width: slider.frame.width, height: slider.frame.height)
        layout.itemSpacing = 5
        layout.itemHorizontalCenter = true
        return layout
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: index) as! SliderCell
        let item = sliderImages[index]
        cell.configure(data: (item ?? UIImage(named: "ic-waters1"))!)
        return cell
    }
    
    
}
