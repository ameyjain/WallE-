//
//  ProgressHud.swift
//  Template
//
//  Created by Mike Lepore on 6/16/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class ProgressHud: NSObject {
    
    
    // MARK: - Show HUD
    
    static func showHud() {
        SVProgressHUD.show()
    }
    
    static func showHud(withStatus status: NSString?) {
        guard let statusString = status as String? else
        {
            ProgressHud.showHud()
            return
        }
        
        SVProgressHUD.show(withStatus: statusString)
    }
    
    static func showHud(showProgress progress: CGFloat) {
        SVProgressHUD.showProgress(Float(progress))
    }
    
    static func showHudShow(progress: CGFloat, status: NSString?) {
        
        guard let statusString = status as String? else {
            SVProgressHUD.showProgress(Float(progress))
            return
        }
        
        SVProgressHUD.showProgress(Float(progress), status: statusString)
    }
    
    
    // MARK: - Hide Hud

    static func dismissHud() {
        SVProgressHUD.dismiss()
    }
    
    static func dismissHud(withDelay delay: CGFloat) {
        let timeInterval: TimeInterval = TimeInterval(delay)
        SVProgressHUD.dismiss(withDelay: timeInterval)
    }
}
