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
    var originalPoint: CGPoint!
    
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
        
        
        let xDistance = sender.translationInView(self.superview!).x
        let yDistance = sender.translationInView(self.superview!).y
        println(yDistance)
        
        switch(sender.state) {
        
        
            case .Began:
                self.originalPoint = self.center
        
            case .Ended:
                self.resetAnimationsAndTransforms()
            
            case .Changed:
                let rotationStrength = min(xDistance/320.0, 1.0) as CGFloat
                let rotationAngel = (2*CGFloat(M_PI)*rotationStrength/16)
                let scaleStrength = 1 - fabs(rotationStrength)/4
                let scale = max(scaleStrength, 0.93)
                self.center = CGPointMake(self.originalPoint.x + xDistance, self.originalPoint.y + yDistance)
                let transform = CGAffineTransformMakeRotation(rotationAngel)
                let scaleTransform = CGAffineTransformScale(transform, scale, scale)
                self.transform = scaleTransform
        
            default:
                break
        }
    }
    
    func resetAnimationsAndTransforms(){
    
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
            self.center = self.originalPoint
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }
}
