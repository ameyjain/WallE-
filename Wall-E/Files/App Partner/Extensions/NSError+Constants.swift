//
//  NSError+Constants.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/21/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation


//Login

extension NSError
{
    static let unknownError = NSError.with(message: Constants.defaultErrorMessage)

    static let passwordEmpty = NSError.with(message: "Password cannot be empty")
    static let passwordTooShort = NSError.with(message: "Please enter a password that is at least 8 characters long")
    static let emailEmpty = NSError.with(message: "Email cannot be empty")
    static let emailInvalid = NSError.with(message: "Email is not valid")

    static let emptyCredentials = NSError.with(message: "Credentials cannot be empty")
    
}
