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
            setSliderUI()
        }
    }
    
    func setSliderUI(){
        slider.transformer = FSPagerViewTransformer(type: .linear)
        slider.automaticSlidingInterval = 3.0
        slider.isInfinite = true
        slider.register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: "SliderCell")
        let transform = CGAffineTransform(scaleX: 0.9, y: 1)
        //CGSize(width: 400, height: 180)
//        slider.itemSize = self.slider.frame.size.applying(transform)
        
        slider.itemSize = CGSize(width: UIScreen.main.bounds.width - 48, height:  UIScreen.main.bounds.height - 400)

        /*
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                slider.itemSize = CGSize(width: 200, height: 200)
                print("iPhone 5 or 5S or 5C")
                
            case 1334:
                slider.itemSize = CGSize(width: 300, height: 400)
                print("iPhone 6/6S/7/8")
                
            case 1920, 2208:
                slider.itemSize = CGSize(width: 350, height: 450)
                print("iPhone 6+/6S+/7+/8+")
                
            case 2436:
                slider.itemSize = CGSize(width: 300, height: 450)
                print("iPhone X/XS/11 Pro")
                
            case 2688:
                slider.itemSize = CGSize(width: 350, height: 450)
                print("iPhone XS Max/11 Pro Max")
                
            case 1792:
                slider.itemSize = CGSize(width: 400, height: 450)
                print("iPhone XR/ 11 ")
                
            default:
                slider.itemSize = CGSize(width: 330, height: 400)//self.slider.frame.size.applying(transform)
                print("Unknown")
            }
        }
        */
        
        slider.decelerationDistance = FSPagerView.automaticDistance
//        slider.interitemSpacing = 2
//        self.slider.clipsToBounds = true
//        slider.setRounded(radius: 40)
//        slider.clipsToBounds = true
        slider.layer.shadowRadius = 0
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
  
    
}
