//
//  Router.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/30/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class Router: NSObject
{
    static func show(destination: Destination)
    {
        switch destination
        {
        case .home(let destination):
            CoreTabBarViewController.instance.changeTabTo(coreScreen: .tab1)
            Router.show(destination: destination)
        case .tab2(_, _):
            CoreTabBarViewController.instance.changeTabTo(coreScreen: .tab2)
        case .preAccount(let destination):
            CoreTabBarViewController.instance.changeTabTo(coreScreen: .tab1)
            Router.show(destination: destination)            
        }
        
    }
    
    static func show(destination: Destination.HomeDestination)
    {
        switch destination
        {
        case .main:
            break //do nothing
        }
    }
    
    static func show(destination: Destination.PreAccountDestination)
    {
        switch destination
        {
        case .login(let onSuccess):
            Router.showLogin(onSuccess: onSuccess)
        case .signUp(let onSuccess):
            Router.showSignUp(onSuccess: onSuccess)
        }
    }
}

//Login and Sign up
extension Router
{
    static func showLogin(onSuccess: NoArgsCompletionBlock?)
    {
        
        let loginVC = LoginViewController(successCompletion: onSuccess)
        CoreTabBarViewController.instance.currentNavController?.present(loginVC, animated: true)
    }
    
    static func showSignUp(onSuccess: NoArgsCompletionBlock?)
    {
        
        let signUpViewController = UINavigationController(rootViewController: SignupViewController(successCompletion: onSuccess))
        CoreTabBarViewController.instance.currentNavController?.present(signUpViewController, animated: false, completion: nil)
    }
}
