//
//  DataManager.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/21/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class DataManager: NSObject
{
    static func loadDataForUserAccount(_ userAccount: String) -> [String: Any]?
    {
        return Locksmith.loadDataForUserAccount(userAccount: userAccount)
    }
    
    static func saveData(data: [String: Any], forUserAccount userAccount: String) throws
    {
        return try Locksmith.saveData(data: data, forUserAccount: userAccount, inService: LocksmithDefaultService)
    }
    
    static func deleteDataForUserAccount(userAccount: String) throws
    {
        return try Locksmith.deleteDataForUserAccount(userAccount:userAccount, inService: LocksmithDefaultService)
    }
    
    static func updateData(data: [String: Any], forUserAccount userAccount: String) throws
    {
        return try Locksmith.updateData(data: data, forUserAccount: userAccount, inService: LocksmithDefaultService)
    }
    
}
