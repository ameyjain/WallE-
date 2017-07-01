//
//  WEPairingViewController.swift
//  WallE
//
//  Created by Amey Home on 6/30/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit
import NMSSH

class WEPairingViewController: UIViewController, CoreViewController {
    
    @IBOutlet weak var isConnectedTextView: UITextField!
    @IBOutlet weak var connectToPiButton: UIButton!
    
    var screenName: String = "Pair Device"
    let session : NMSSHSession = NMSSHSession(host: Constants.HOST, andUsername: Constants.USER_NAME)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Buttons
    
    @IBAction func connectToPi(_ sender: Any) {
        
        session.connect()
        
        if session.isConnected {
            session.authenticate(byPassword: Constants.PASSWORD)
            
            isConnectedTextView.isHidden = false
            connectToPiButton.isHidden = true
            
            if session.isAuthorized {
                NSLog("Authentication Succeeded!!")
            }
        }
    }

}
