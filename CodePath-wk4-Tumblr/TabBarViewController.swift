//
//  TabBarViewController.swift
//  CodePath-wk4-Tumblr
//
//  Created by Yinan iMac on 2/25/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIApplicationDelegate {
    // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var tabBarButtons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var tabBarViewControllers: [UIViewController]!
    
    var selectedTab = 0
    
    @IBOutlet weak var annoyingTutorial: UIImageView!
    var noMoreAnnoyingTutorial = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // with help from Kenan
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willResumeAnimation:", name:"willResumeAnimation", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "resumeAnimation:", name:"resumeAnimation", object: nil)
        
        print("view did load")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        tabBarViewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Tab-Bar#step-10-set-the-initial-tab-when-the-app-starts
        tabBarButtonTouchUpInside(tabBarButtons[selectedTab])
        
        animateBounce(annoyingTutorial)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @IBAction func composeButtonTouchUpInside(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: nil)
    }
    
    // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Modal-Transition#step-3-define-the-transition-variable
    var fadeTransition: FadeTransition!
    
    // https://github.com/codepath/ios_guides/wiki/Creating-a-Custom-Modal-Transition#step-4-setup-the-prepareforsegue-method
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.3
    }
    
    // my first function in Swift
    func animateBounce (animatedImage: UIImageView) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [.Autoreverse, .Repeat, .CurveEaseInOut], animations: { () -> Void in
            animatedImage.frame.origin.y -= 15
            }, completion: nil)
    }
    
    // with help from Kenan
    @objc func willResumeAnimation(notification: NSNotification){
        annoyingTutorial.hidden = true
        print("hide")
    }
    @objc func resumeAnimation(notification: NSNotification){
        annoyingTutorial.frame.origin.y = 452 
        annoyingTutorial.hidden = false
        animateBounce(annoyingTutorial)
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
