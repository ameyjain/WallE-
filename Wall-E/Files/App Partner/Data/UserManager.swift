//
//  UserManager.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

final class UserManager: NSObject
{
    fileprivate let SavedUserDataKey: String = "mainUserAccount"
    
    static let shared = UserManager()
    
    // Read-only property. To set call login() or logout()
    public fileprivate(set) var  currentUser: UserData?
    
    var loggedIn: Bool
    {
        guard let currentUser = self.currentUser,
              currentUser.userId != 0
        else { return false }
        
        return true
    }
    
    // MARK: Public
    func loadLocalUser()
    {
        guard let dataLoaded = DataManager.loadDataForUserAccount(SavedUserDataKey) else { return }
        guard let userDict = dataLoaded[SavedUserDataKey] as? [AnyHashable: Any] else { return }
        
        self.currentUser = UserData(dictionary: userDict)
    }
    
    func login(email: String?, password: String?, completion: GenericCompletionBlock?)
    {
        CredentialsClient.login(email: email, password: password)
        { (succeeded, error, user) in
            guard let user = user else
            {
                print("Login failed")
                completion?(succeeded, error)
                return
            }
            
            print("Login succeeded")
            self.currentUser = user
            self.saveLocalUser(user: user)
            
            completion?(succeeded, error)
        }
    }
    
    func signup(username: String?, email: String?, password: String?, completion: GenericCompletionBlock?)
    {
        CredentialsClient.signUp(username: username, email: email, password: password) { (succeeded, error, user) in
            guard let user = user else {
                print("Signup failed")
                completion?(succeeded, error)
                return
            }
            
            print("Signup succeeded")
            self.currentUser = user
            self.saveLocalUser(user: user)
            
            completion?(succeeded, error)
        }
    }
    
    func logout(completion: GenericCompletionBlock?)
    {
        self.deleteLocalUser
        { (succeeded, error) in
            
            guard succeeded else
            {
                completion?(succeeded, error)
                return
            }
            
            self.displayLoginScreen(onSuccess:
            {
                Router.show(destination: Destination.home(destination: .main))
            })
        }
    }
    
    func displayLoginScreen(onSuccess: NoArgsCompletionBlock?)
    {
        Router.show(destination: Destination.preAccount(destination: .signUp(onSuccess: onSuccess)))
    }
}

// MARK: Private
fileprivate extension UserManager
{
    // MARK: Main User Data Management
    
    func saveLocalUser(user: UserData)
    {
        let userDict: [AnyHashable: Any] = user.toDictionary()
        
        do {
            try DataManager.updateData(data: [SavedUserDataKey: userDict], forUserAccount: SavedUserDataKey)
        } catch {
            print("Error saving " + SavedUserDataKey)
        }
    }
    
    func deleteLocalUser(completion: GenericCompletionBlock?)
    {
        guard self.currentUser != nil else
        {
            completion?(false, NSError.with(message: "Can't delete an empty local user"))
            return
        }
        
        do {
            try DataManager.deleteDataForUserAccount(userAccount: SavedUserDataKey)
            completion?(true, nil)
        } catch {
            completion?(false, NSError.with(message: "Error deleting user"))
        }
    }
}
