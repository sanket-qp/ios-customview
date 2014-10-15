//
//  CardsViewController.swift
//  DraggableView
//
//  Created by sanket patel on 10/13/14.
//  Copyright (c) 2014 sanket patel. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var profileImageView: DraggableImageView!
    var tapGestureRecognizer: UITapGestureRecognizer!
    
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
            let vc = nc.viewControllers.first as ProfileViewController
            vc.profileImage = self.profileImageView.image
        
        }
    
    }

}
