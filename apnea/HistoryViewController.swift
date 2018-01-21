//
//  HistoryViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class HistoryViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    let listControllers = ["HistoryApneaTest", "HistoryTraining"]
    
    private(set) lazy var listViewControllers: [UIViewController] = {
        return listControllers.map {
            self.newViewController(name: $0)
        }
    }()

    private func newViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "\(name)VC")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let defaultViewController = listViewControllers.first {
            setViewControllers([defaultViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = listViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard listViewControllers.count > previousIndex else {
            return nil
        }
        
        return listViewControllers[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = listViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let listViewControllersCount = listViewControllers.count
        
        guard listViewControllersCount != nextIndex else {
            return nil
        }
        
        guard listViewControllersCount > nextIndex else {
            return nil
        }
        
        return listViewControllers[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return listViewControllers.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        guard let firstViewController = listViewControllers.first, let firstViewControllerIndex = listViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }

}
