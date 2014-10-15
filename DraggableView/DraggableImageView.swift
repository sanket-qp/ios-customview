//
//  DraggableImageView.swift
//  DraggableView
//
//  Created by sanket patel on 10/13/14.
//  Copyright (c) 2014 sanket patel. All rights reserved.
//

import UIKit

class DraggableImageView: UIImageView {
    
    @IBOutlet var containerView: UIView!
    var panGestureRegognizer: UIPanGestureRecognizer!
    
    override init() {
    
        super.init()
        setup()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
   
    override init(image: UIImage) {
    
        super.init(image: image)
        setup()
    }
    
    func setup() {
    
        /* following code is not needed, it's just for reference
           we don't need a nib here, we are just enhancing UIImageView, 
           that is done by subclassing UIImageView and adding Gesture Recognizer and didPan method
        */
        //var nib = UINib(nibName: "Draggable", bundle: nil)
        //nib.instantiateWithOwner(self, options: nil)
        //containerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)

        self.userInteractionEnabled = true
        panGestureRegognizer = UIPanGestureRecognizer(target: self, action: "didPan:")
        self.addGestureRecognizer(panGestureRegognizer)
    }
    
    
    func didPan(sender: UIPanGestureRecognizer) {
        
        if (sender.state == .Changed) {
            
            let location = sender.locationInView(self.superview)
            self.center = location
        }
    }
}
