//
//  SystemVersion.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class SystemVersion: NSObject
{
    static func equalTo(_ version: CGFloat) -> Bool
    {
        return SystemVersion.compare(version: version, isEqual: true, comparisonResult: ComparisonResult.orderedSame)
    }
    
    static func greaterThan(_ version: CGFloat) -> Bool
    {
        return SystemVersion.compare(version: version, isEqual: true, comparisonResult: ComparisonResult.orderedDescending)
    }
    
    static func greaterThanOrEqual(_ version: CGFloat) -> Bool
    {
        return SystemVersion.compare(version: version, isEqual: false, comparisonResult: ComparisonResult.orderedAscending)
    }
    
    static func lessThan(_ version: CGFloat) -> Bool
    {
        return SystemVersion.compare(version: version, isEqual: true, comparisonResult: ComparisonResult.orderedAscending)
    }
    
    static func lessThanOrEqual(_ version: CGFloat) -> Bool
    {
        return SystemVersion.compare(version: version, isEqual: false, comparisonResult: ComparisonResult.orderedDescending)
    }
    
    private static func compare(version: CGFloat, isEqual: Bool, comparisonResult: ComparisonResult) -> Bool
    {
        let versionString = String(describing: version)
        return UIDevice.current.systemVersion.compare(versionString, options: .numeric) != comparisonResult
    }
}
