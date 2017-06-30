//
//  KeyboardListener.swift
//  bhphoto
//
//  Created by Vladyslav Gusakov on 3/2/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

final class BHKeyboardListener: NSObject
{
    static let shared = BHKeyboardListener()
    
    var isVisible = false
    var keyboardFrame = CGRect.zero
    var isListening = false
    
    func startListening()
    {
        guard !self.isListening else { return }
        
        self.isListening = true
                
        NotificationCenter.when(.UIKeyboardWillShow)
        { [weak self] notification in
            self?.keyboardWillShow(notification)
        }
        
        NotificationCenter.when(.UIKeyboardWillHide)
        { [weak self] notification in
            self?.keyboardWillHide(notification)
        }
    }
    
    func stopListening()
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func keyboardWillShow(_ notification: Notification)
    {
        self.isVisible = true
        self.keyboardFrame = self.keyboardFrame(fromNotification: notification)
    }
    
    fileprivate func keyboardWillHide(_ notification: Notification)
    {
        self.isVisible = false
        self.keyboardFrame = keyboardFrame(fromNotification: notification)
    }
    
    fileprivate func keyboardFrame(fromNotification notification: Notification) -> CGRect
    {
        return notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect ?? CGRect.zero
    }
    
    deinit
    {
        self.stopListening()
    }
}
