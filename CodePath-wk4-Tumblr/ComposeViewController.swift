//
//  ComposeViewController.swift
//  CodePath-wk4-Tumblr
//
//  Created by Yinan iMac on 2/27/16.
//  Copyright © 2016 YinanLearningSwift. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIImageView!
    @IBOutlet weak var photoButton: UIImageView!
    @IBOutlet weak var chatButton: UIImageView!
    @IBOutlet weak var quoteButton: UIImageView!
    @IBOutlet weak var videoButton: UIImageView!
    @IBOutlet weak var linkButton: UIImageView!
    
    @IBOutlet weak var blurView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.frame
        blurView.addSubview(effectView)
    }

    override func viewWillAppear(animated: Bool) {
        textButton.frame.origin.y = view.bounds.height
        photoButton.frame.origin.y = view.bounds.height
        chatButton.frame.origin.y = view.bounds.height
        quoteButton.frame.origin.y = view.bounds.height + textButton.bounds.height
        videoButton.frame.origin.y = view.bounds.height + photoButton.bounds.height
        linkButton.frame.origin.y = view.bounds.height + chatButton.bounds.height
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let topButtonsOriginY = CGFloat(160)
        let bottomButtonsOriginY = CGFloat(273)
        let duration = 0.35
        let delay = Double(0.2)
        let damping = CGFloat(0.77)
        
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.textButton.frame.origin.y = topButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(duration, delay: delay*9, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.photoButton.frame.origin.y = topButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(duration, delay: delay*2, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.chatButton.frame.origin.y = topButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(duration, delay: delay*3, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.quoteButton.frame.origin.y = bottomButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(duration, delay: delay*4, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.videoButton.frame.origin.y = bottomButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(duration, delay: delay*5, usingSpringWithDamping: damping, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.linkButton.frame.origin.y = bottomButtonsOriginY
            }, completion: nil)
        UIView.animateWithDuration(0.1, delay: delay*9 + 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            self.videoButton.frame.origin.y = bottomButtonsOriginY - 15
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                    self.videoButton.frame.origin.y = bottomButtonsOriginY
                    }, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonTouchUpInside(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
