//
//  NSError+Helpers.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation

extension NSError
{
    struct Constants
    {
        static let defaultDomain = "Template.Error"
        static let defaultErrorCode = NSURLErrorUnknown
        static let defaultErrorMessage = "Unknown error occured"
        static let defaultFailureName = "GENERIC_ERROR"
    }
    
    var isDisplayable: Bool
    {
        //List of error descriptions can be found here http://nshipster.com/nserror/
        if self.domain == NSURLErrorDomain
        {
            return true
        }
        
        return self.domain == Constants.defaultDomain
    }
        
    static func with(message: String?) -> NSError
    {
        return NSError.with(message: message, code: Constants.defaultErrorCode, failureName: Constants.defaultFailureName)
    }
    
    static func with(message: String?, code: Int?, failureName: String? = nil) -> NSError
    {
        let errorDomain = Constants.defaultDomain
        let errorCode = code ?? Constants.defaultErrorCode
        let errorMessage = message ?? Constants.defaultErrorMessage
        let failureName = failureName ?? Constants.defaultFailureName
        
        let error = NSError(domain: errorDomain, code: errorCode, userInfo: [NSLocalizedDescriptionKey: errorMessage,
                                                                             NSLocalizedFailureReasonErrorKey: failureName])
        print("Error: " + errorMessage)
        return error
    }
    
    static func from(dictionary: [String: Any]?) -> NSError?
    {
        guard let dictionary = dictionary,
              let status = dictionary["status"] as? String,
              status == "error"
        else
        {
            return nil
        }
        
        let errorFailureName = dictionary["name"] as? String
        let errorCode = dictionary["code"] as? Int
        let errorMessage = dictionary["message"] as? String
        
        return NSError.with(message: errorMessage, code: errorCode, failureName: errorFailureName)
    }
    
}
