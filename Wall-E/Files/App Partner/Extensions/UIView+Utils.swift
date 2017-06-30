//
//  UIView+Utils.swift
//  Template
//
//  Created by Mike Lepore on 5/24/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

extension UIView
{
    func addBlurView(blurStyle: UIBlurEffectStyle) {
        
        let blurEffect = UIBlurEffect(style: blurStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.insertSubview(blurEffectView, at: 0)
    }
    
}
