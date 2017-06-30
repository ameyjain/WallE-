//
//  Destination.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/30/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

enum Destination
{
    case home(destination: HomeDestination)
    case tab2(parameter1: String?, parameter2: Int)
    case preAccount(destination: PreAccountDestination)
    
    enum HomeDestination
    {
        case main
    }
    
    enum PreAccountDestination
    {
        case login(onSuccess: NoArgsCompletionBlock?)
        case signUp(onSuccess: NoArgsCompletionBlock?)
    }
}
