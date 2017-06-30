//
//  GeneralInfoManager.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class GeneralInfoManager: NSObject
{
    static let shared = GeneralInfoManager()
    
    private struct Constants
    {
        static let GeneralInfo = "GeneralInfo"
    }
    
    var generalInfo: GeneralInfoData?
    {
        let jsonData = UserDefaults.standard.object(forKey: Constants.GeneralInfo) as? GeneralInfoData
        let dictionary = jsonData?.toDictionary()
        return GeneralInfoData(dictionary: dictionary)
    }
    
    func fetchGeneralInfo()
    {
        GeneralInfoClient.fetch(with: UserManager.shared.currentUser)
        { [weak self] (succeeded, error, generalInfo) in
            
            guard let generalInfo = generalInfo
            else { return }
            
            self?.saveToDisk(generalInfo)
        }
    }
    
    private func saveToDisk(_ generalInfo: GeneralInfoData)
    {
        let jsonData = generalInfo.toJSONData()
        UserDefaults.standard.set(jsonData, forKey: Constants.GeneralInfo)
    }
}
