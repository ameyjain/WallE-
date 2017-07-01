//
//  ServiceManager.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/23/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class ServiceManager: NSObject
{
    @objc enum Service: NSInteger
    {
        case GoogleAnalytics
        case Notifications
        
        var string: String
        {
            switch self
            {
            case .GoogleAnalytics:
                return "GoogleAnalytics"
            case .Notifications:
                return "Notifications"
            }
        }
    }
    
    static let shared = ServiceManager()
    
    var enabledServices = [Service]()
    
    //MARK: - Public
    func enable(service: Service)
    {
        self.enable(service: service, completion: nil)
    }
    
    func enable(service: Service, completion: NoArgsCompletionBlock?)
    {
        guard !enabledServices.contains(service) else
        {
            print("Warning: \(service.string) is already enabled")
            return
        }
        
        switch service
        {
        case .GoogleAnalytics:
            self.trackGoogleAnalytics()
        case .Notifications:
            break
        }
        
        self.enabledServices.append(service)
        
        completion?()
    }
    
    func enable(services: [Service])
    {
        services.forEach { self.enable(service: $0) }
    }
    
    func isEnabled(_ service: Service) -> Bool
    {
        return self.enabledServices.contains(service)
    }
    
    private func trackGoogleAnalytics()
    {
        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().logger.logLevel = .error
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().tracker(withTrackingId: Constants.key_GoogleAnalyticsTrackingId)
    }
}
