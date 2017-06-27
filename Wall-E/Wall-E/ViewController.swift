//
//  ViewController.swift
//  Wall-E
//
//  Created by Amey Jain on 6/26/17.
//  Copyright © 2017 Wall-E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var session : NMSSHSession
    
    @IBOutlet weak var switchOne: UISwitch!
    @IBOutlet weak var switchTwo: UISwitch!
    @IBOutlet weak var switchThree: UISwitch!
    @IBOutlet weak var switchFour: UISwitch!
    @IBOutlet weak var connectToPiButton: UIButton!
    @IBOutlet weak var isConnectedTextView: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        
        session = NMSSHSession(host: Constants.HOST, andUsername: Constants.USER_NAME)
        super.init(coder: aDecoder)

    }
    
    // MARK: Lifecycle implementation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        isConnectedTextView.isHidden = true
        connectToPiButton.isHidden = false
        switchOne.setOn(false, animated: false)
        switchTwo.setOn(false, animated: false)
        switchThree.setOn(false, animated: false)
        switchFour.setOn(false, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        session.disconnect()
    }
    
    //MARK: Switch Click implementation
    
    func switchClicked (withScript script: String) {
        
        if session.isConnected {
            
            var error : NSError? = nil
            let response : String = session.channel.execute("python \(script)", error: &error, timeout: 5000)
            
            NSLog(response as String)
            
        } else {
            
            connectToPi(self)
            switchClicked(withScript: script)
        }
        
    }
    
    @IBAction func switchOneClicked(_ sender: Any) {
        
        switchClicked(withScript: Constants.SWITCH_ONE)
    }
    
    @IBAction func switchTwoClicked(_ sender: Any) {
        
        switchClicked(withScript: Constants.SWITCH_TWO)
    }
    
    @IBAction func switchThreeClicked(_ sender: Any) {
        
        switchClicked(withScript: Constants.SWITCH_THREE)
    }
    
    @IBAction func switchFourClicked(_ sender: Any) {
        
        switchClicked(withScript: Constants.SWITCH_FOUR)
    }
    
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

