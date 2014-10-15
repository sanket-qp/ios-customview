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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if profileImage != nil {
        
            profileImageView.image = profileImage!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    @IBAction func onDone(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
