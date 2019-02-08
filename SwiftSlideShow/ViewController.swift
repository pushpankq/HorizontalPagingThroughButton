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
          //  welcomeImage.image = imageArray[pageIndex]
        }
        
    }
    
    let titleArray = ["Welcome to Galen", "Best Doctor Support", "Fast & Easy"]
    let subTitleArray = ["We Provide Best Online Medical Service.", "We Provide Best Online Medical Service.", "Easy To Connect with World Class Doctors "]
    let imageArray = [#imageLiteral(resourceName: "images"), #imageLiteral(resourceName: "rTjrBgbgc"), #imageLiteral(resourceName: "Slide 4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageIndex = 0
        configureScrollView()
        addImageOnScrollView()

       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBAction
    @IBAction func nextPage(_ sender: UIButton) {
        
        pageIndex = pageIndex+1
        print(pageIndex)
        print(titleArray.count)
        
        if pageIndex < titleArray.count-1 {
            
            scrollView.setContentOffset(CGPoint(x: (scrollViewWidth * CGFloat((pageIndex))), y: 0), animated: true)
            
        } else if pageIndex == titleArray.count-1 {
            
            sender.setTitle("Get Started", for: .normal)
            scrollView.setContentOffset(CGPoint(x: (scrollViewWidth * CGFloat((pageIndex))), y: 0), animated: true)
            sender.isEnabled = false
        }
        
    }
    
    
    func goToPoint(pageIndex:Int) {
        
        DispatchQueue.main.async(execute: { () -> Void in
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear, animations: {
                self.scrollView.contentOffset.x = (self.scrollViewWidth * CGFloat((pageIndex+1)))
            }, completion: nil)
            
        })
    }
    
    
    func addImageOnScrollView()  {
        
        let imgOne = UIImageView(frame: CGRect(x:29, y:76,width:317, height:280))
        imgOne.image = imageArray[0]
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth + 29, y:76, width:317, height:280))
        imgTwo.image = imageArray[1]
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2 + 29 , y:76, width:317, height:280))
        imgThree.image = imageArray[2]
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)

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

