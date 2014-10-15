//
//  CardsViewController.swift
//  DraggableView
//
//  Created by sanket patel on 10/13/14.
//  Copyright (c) 2014 sanket patel. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var profileImageView: DraggableImageView!
    var tapGestureRecognizer: UITapGestureRecognizer!
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView = DraggableImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        profileImageView.image = UIImage(named: "timandtina")
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTap:")
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(profileImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTap(sender: UITapGestureRecognizer) {
    
        performSegueWithIdentifier("profileSegue", sender: self)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {

    
        if segue.identifier == "profileSegue" {
        
            let nc = segue.destinationViewController as UINavigationController
            nc.modalPresentationStyle = UIModalPresentationStyle.Custom
            nc.transitioningDelegate = self
            
            let vc = nc.viewControllers.first as ProfileViewController
            vc.profileImage = self.profileImageView.image
        }
    }

    
    // UIViewControllerTransitioningDelegate methods(s)
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    // UIViewControllerAnimatedTransitioning method(s)
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as UIViewController!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as UIViewController!
        
        if (isPresenting) {
        
            containerView.addSubview(toViewController!.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                toViewController!.view.alpha = 1
                
            }, completion: { (finished: Bool) -> Void in
                
                transitionContext.completeTransition(true)
            })
        
        } else {
        
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                println("stupid swift")
                fromViewController.view.alpha = 0
                
                }, completion: { (finished: Bool) -> Void in
                
                    transitionContext.completeTransition(true)
                    fromViewController?.view.removeFromSuperview()
            })
        
        }
    }
}
