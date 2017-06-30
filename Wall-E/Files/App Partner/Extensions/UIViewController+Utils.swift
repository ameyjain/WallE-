//
//  UIViewController+Utils.swift
//  Template
//
//  Created by App Partner on 5/24/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

extension UIViewController
{
    func displaySimpleAlertWith(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func displayErrorAlert(_ error: NSError?)
    {
        self.displayErrorAlert(error, title: nil)
    }
    
    func displayErrorAlert(_ error: NSError?, title: String?)
    {
        guard let error = error else { return }
        
        let title = title ?? "Error"
        //We only want to show our custom and backend error description, to display any other error call `displaySimpleAlertWith:`
        
        let message = error.isDisplayable ? error.localizedDescription : "Try again later!"
        self.displaySimpleAlertWith(title: title, message: message)
    }
}
