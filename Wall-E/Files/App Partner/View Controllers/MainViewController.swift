//
//  MainViewController.swift
//  WallE
//
//  Created by Amey Home on 6/30/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit
import NMSSH

class MainViewController: UIViewController, CoreViewController {
    
    var screenName: String = "Home"
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configureUI()
    }

// MARK: UI config
    
    func configureUI() {
        
        if !UserManager.shared.loggedIn {
            
            UserManager.shared.displayLoginScreen(onSuccess: nil)
        }
    }
    
      
// MARK: Tableview Delegates
    
    
// MARK: Tableview Data source
    
}
