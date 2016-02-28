//
//  TabBarViewController.swift
//  CodePath-wk4-Tumblr
//
//  Created by Yinan iMac on 2/25/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var tabBarButtons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var tabBarViewControllers: [UIViewController]!
    
    var selectedTab = 0
    
    var noMoreAnnoyingTutorial = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        tabBarViewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar#step-10-set-the-initial-tab-when-the-app-starts
        tabBarButtonTouchUpInside(tabBarButtons[selectedTab])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var annoyingTutorial: UIImageView!
    
    @IBAction func tabBarButtonTouchUpInside(sender: UIButton) {
        let lastSelectedTab = selectedTab
        selectedTab = sender.tag
        
        if selectedTab == 1 {
            noMoreAnnoyingTutorial = true
        }
        
        if noMoreAnnoyingTutorial == true {
            annoyingTutorial.hidden = true
        } else {
            annoyingTutorial.hidden = false
        }
        
        // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar#step-8-remove-the-previous-viewcontroller-and-set-button-state
        tabBarButtons[lastSelectedTab].selected = false
        let lastViewController = tabBarViewControllers[lastSelectedTab]
        lastViewController.willMoveToParentViewController(nil)
        lastViewController.view.removeFromSuperview()
        lastViewController.removeFromParentViewController()
        
        // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar#step-9-add-the-new-viewcontroller-and-set-button-state
        sender.selected = true
        let currentViewController = tabBarViewControllers[selectedTab]
        addChildViewController(currentViewController)
        currentViewController.view.frame = contentView.bounds
        contentView.addSubview(currentViewController.view)
        currentViewController.didMoveToParentViewController(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
