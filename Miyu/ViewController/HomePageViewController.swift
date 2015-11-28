//
//  HomePageViewController.swift
//  Miyu
//
//  Created by Cee on 25/11/2015.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class HomePageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        let page1: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("page1")
        let page2: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("page1")
        
        pages.append(page1)
        pages.append(page2)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.init(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let index = (currentIndex - 1) % pages.count
        return index < 0 ? nil : pages[index]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let index = (currentIndex + 1) % pages.count
        return index == 0 ? nil : pages[index]
    }
}

extension HomePageViewController: UIPageViewControllerDelegate {
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}