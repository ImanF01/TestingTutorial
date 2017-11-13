//
//  PageViewController.swift
//  Tutorial
//
//  Created by Iman F on 11/12/17.
//  Copyright © 2017 Iman F (group project). All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let startTutorialVC = self.viewControllerAtIndex(index: 0) {
            setViewControllers([startTutorialVC], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextPageWithIndex(index: Int)
    {
        return
    }
    func viewControllerAtIndex(index: Int) -> ViewController?
    {
        if index == NSNotFound || index < 0 {
        //add index > number of pages
            return nil
        }
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "viewController")
            as? ViewController
        {
            viewController.index = index
            
            return viewController
        }
        return nil
    }

}
extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ViewController).index
        index -= 1
        
        return self.viewControllerAtIndex(index: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ViewController).index
        index += 1
        
        return self.viewControllerAtIndex(index: index)
    }
    
    
}
