//
//  ProfileViewController.swift
//  DraggableView
//
//  Created by sanket patel on 10/14/14.
//  Copyright (c) 2014 sanket patel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var profileImage: UIImage?
    var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.tintColor = .clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav_bar2"), forBarMetrics: UIBarMetrics.Default)
        // Do any additional setup after loading the view.
        if profileImage != nil {
        
            profileImageView.image = profileImage!
            profileImageView.userInteractionEnabled = true
            tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTap:")
            profileImageView.addGestureRecognizer(tapGestureRecognizer)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func didTap(sender: AnyObject) {
    
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
