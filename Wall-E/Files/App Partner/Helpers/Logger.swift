//
//  Logger.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/25/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class Logger: NSObject
{
    @objc enum LogType: Int
    {
        case none
        case warning
        case error
        case networking
        case checkmark
    }
    
    //Add log types you would like to ignore
    private static let ignoredLogTypes: [LogType] = []
    
    static func log(_ value: Any)
    {
        Logger.log(value, type: .none)
    }
    
    static func log(_ value: Any, type: LogType)
    {
        guard !Logger.ignoredLogTypes.contains(type) else
        {
            return
        }
        
        let prefixIcon: String
        
        switch type
        {
        case .none:
            prefixIcon = "➤ "
        case .warning:
            prefixIcon = "⚠️ "
        case .error:
            prefixIcon = "🔴 "
        case .networking:
            prefixIcon = "🚀 "
        case .checkmark:
            prefixIcon = "✅ "
        }
        
        print(prefixIcon, separator: "", terminator: "")
        print(value)
    }
}
