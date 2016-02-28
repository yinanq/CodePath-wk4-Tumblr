//
//  HomeViewController.swift
//  CodePath-wk4-Tumblr
//
//  Created by Yinan iMac on 2/27/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func loginButtonTouchUpInside(sender: AnyObject) {
        performSegueWithIdentifier("loginSegue", sender: self)
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
