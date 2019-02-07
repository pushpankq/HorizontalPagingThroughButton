//
//  ViewController.swift
//  SwiftSlideShow
//
//  Created by Pushpank  on 7/2/2019.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import UIKit
import CHIPageControl


class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    // If you want to customize the page control like galen app use CHIPageControlJaloro pod
    // Outlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var welcomeSubTitleLabel: UILabel!
    @IBOutlet var welcomeTitleLabel: UILabel!
    @IBOutlet var welcomeImage: UIImageView!
    
    var scrollViewWidth:CGFloat = 0
    var pageIndex = -1 {
        
        didSet {
            
            self.pageControl.currentPage = pageIndex;
            welcomeTitleLabel.text = titleArray[pageIndex]
            welcomeSubTitleLabel.text = subTitleArray[pageIndex]
            welcomeImage.image = imageArray[pageIndex]
        }
        
    }
    
    let titleArray = ["Welcome to Galen", "Best Doctor Support", "Fast & Easy"]
    let subTitleArray = ["We Provide Best Online Medical Service.", "We Provide Best Online Medical Service.", "Easy To Connect with World Class Doctors "]
    let imageArray = [#imageLiteral(resourceName: "images"), #imageLiteral(resourceName: "rTjrBgbgc"), #imageLiteral(resourceName: "Slide 4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageIndex = 0
        configureScrollView()
     //   pageWidth = scrollView.frame.width

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IB Action
    @IBAction func nextPage(_ sender: UIButton) {
        
        pageIndex = pageIndex+1
        
        if pageIndex < titleArray.count-2 {
            
            scrollView.setContentOffset(CGPoint(x: (scrollViewWidth * CGFloat((pageIndex+1))), y: 0), animated: true)
            
        } else if pageIndex == titleArray.count-1 {
            
            sender.setTitle("Get Started", for: .normal)
            scrollView.setContentOffset(CGPoint(x: (scrollViewWidth * CGFloat((pageIndex+1))), y: 0), animated: true)
            sender.isEnabled = false
            
        }
        
    }
    
    // MARK: Private Methods
    // Configure scrollView
   private func configureScrollView() {
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        scrollViewWidth = self.scrollView.frame.width
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        scrollView.isScrollEnabled = false
    }
   
}

