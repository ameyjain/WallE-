//
//  GeneralInfoClient.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class GeneralInfoClient: NSObject
{
    typealias GeneralInfoCompletionBlock = (_ succeeded: Bool, _ error: Error?, _ generalInfo: GeneralInfoData?) -> Void
    
    private struct Constants
    {
        static let fetchGeneralInfo = "fetch-general-info.php"
        
        struct Parameters
        {
            static let userId = "user_id"
        }
    }
    
    static func fetch(with user: UserData?, completion: GeneralInfoCompletionBlock?)
    {
        guard let user = user else
        {
            print("User cannot be empty")
            completion?(false, NSError.with(message: "User cannot be empty"), nil)
            return
        }
        
        let parameters = user.toDictionary(withKeys: [Constants.Parameters.userId]) as? [String: Any]
        
        NetworkingClient.request(method: .POST, urlString: Constants.fetchGeneralInfo, parameters: parameters, withSuccess:
        { dictionary in
            guard let generalInfo = GeneralInfoData(dictionary: dictionary) else
            {
                completion?(false, NSError.with(message: "Failed to fetch General Info"), nil)
                return
            }
            completion?(true, nil, generalInfo)
        })
        { error in
            completion?(false, error, nil)
        }
    }
    
}
