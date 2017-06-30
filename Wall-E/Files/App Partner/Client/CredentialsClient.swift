//
//  CredentialsClient.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/25/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class CredentialsClient: NSObject
{
    typealias LoginCompletionBlock = (_ succeeded: Bool, _ error: Error?, _ user: UserData?) -> Void
    
    enum CredentialsAction
    {
        case login(username: String?, password: String?)
        case logout(user: UserData?)
        case signUp
        case forgotPassword(email: String?)
    }
    
    private struct Constants
    {
        static let login = "email-login.php"
        static let logout = "email-logout.php"
        static let signUp = "email-signup.php"
        
        static let email = "user_email"
        static let username = "user_username"
        static let password = "user_password"
    }
    
    static func login(email: String?, password: String?, with completion: LoginCompletionBlock?)
    {
        guard let email = email,
              let password = password
        else
        {
            print("Credentials cannot be empty")
            completion?(false, NSError.emptyCredentials, nil)
            return
        }
        
        let urlString = Constants.login
        let parameters = [Constants.email: email, Constants.password: password]
        
        NetworkingClient.request(method: .POST, urlString: urlString, parameters: parameters, withSuccess:
        { dictionary in
            guard let user = UserData(dictionary: dictionary) else
            {
                completion?(false, NSError.with(message: "Login failed"), nil)
                return
            }
            completion?(true, nil, user)
        })
        { error in
            //handle error
            completion?(false, error, nil)
        }
    }
    
    static func logout(user: UserData?, with completion: GenericCompletionBlock?) {
    }
    
    static func signUp(username: String?, email: String?, password: String?, with completion: LoginCompletionBlock?) {
        
        guard let username = username, let email = email, let password = password else {
            print("Credentials cannot be empty")
            completion?(false, NSError.emptyCredentials, nil)
            return
        }

        let urlString  =  Constants.signUp
        let parameters = [Constants.username: username,
                          Constants.email: email,
                          Constants.password: password]
        
        NetworkingClient.request(method: .POST, urlString: urlString, parameters: parameters, withSuccess: { dictionary in
                guard let user = UserData(dictionary: dictionary) else {
                    completion?(false, NSError.with(message: "Sign up failed"), nil)
                    return
                }
                completion?(true, nil, user)
        }) { error in
            completion?(false, error as NSError?, nil)
        }
    }
    
    static func forgotPassword(email: String?, with completion: GenericCompletionBlock?) {
        
        guard let email = email,
              !email.isEmpty
        else
        {
            completion?(false, NSError.with(message: "Email cannot be empty"))
            return
        }
        
        let parameters = [Constants.email: email]
        
        NetworkingClient.request(method: .POST, urlString: "send-forgot-password-email.php", parameters: parameters, withSuccess: { dictionary in
            completion?(true, nil)
        })
        { error in
            completion?(false, error)
        }
    }
}
