//
//  FeedVC.swift
//  ShomooaUnitOneTask
//
//  Created by شموع صلاح الدين أبو رزق on 09/08/2022.
//

import UIKit
import FSPagerView


class FeedVC: BaseVC {

    @IBOutlet weak var containeerImagee: UIImageView!
    @IBOutlet weak var containnerView: UIView!
    
    @IBOutlet weak var personImgContainer: UIView!
    @IBOutlet weak var personImag: UIImageView!
    
    @IBOutlet weak var slider: FSPagerView! {
        didSet {
            
            self.slider.transformer = FSPagerViewTransformer(type: .linear)
            self.slider.automaticSlidingInterval = 3.0
            self.slider.isInfinite = true
            self.slider.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: "SliderCell")
            let transform = CGAffineTransform(scaleX: 0.9, y: 1)
            self.slider.itemSize = self.slider.frame.size.applying(transform)
            self.slider.decelerationDistance = FSPagerView.automaticDistance
            self.slider.interitemSpacing = 2
//            self.slider.shadowOpacity = 0.0
//            self.slider.shadowRadius = 0
            self.slider.clipsToBounds = true 
            self.slider.layer.shadowRadius = 0
        }
    }
    
    
    let sliderImages = [UIImage(systemName: "moon.zzz"),
                        UIImage(systemName: "sun.min.fill"),
                        UIImage(systemName: "lightbulb")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
       
        
        
        
    }

    
    func setUI() {
        containnerView.setRounded()
        containnerView.clipsToBounds = true
        containeerImagee.setRounded()
        containeerImagee.clipsToBounds = true
        
        personImgContainer.setRounded()
        personImgContainer.clipsToBounds = true
        personImag.setRounded()
        personImag.clipsToBounds = true
        
        slider.delegate = self
        slider.dataSource = self
    }
    
}

//MARK: - Pager View DataSource & Delegate

extension FeedVC: FSPagerViewDataSource, FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return sliderImages.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "SliderCell", at: index) as! SliderCell
        let item = sliderImages[index]
        cell.configure(data: (item ?? UIImage(named: "ic-waters1"))!)
        return cell
    }
    
//    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
//        let cell = cell as! SliderCell
//       //pageControll.currentPage = index
//    }
//    // MARK:- FSPagerViewDelegate
//    
//    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
//        //self.pageControll.currentPage = targetIndex
//    }
    
    
}
