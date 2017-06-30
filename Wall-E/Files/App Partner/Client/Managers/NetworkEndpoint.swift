//
//  NetworkEndpoint.swift
//  Template
//
//  Created by App Partner on 5/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class NetworkEndpoint: NSObject
{
    static let shared = NetworkEndpoint()
    
    // MARK: Keys
    private static let key: String = "server_endpoint"

    // MARK: Endpoints
    private enum Endpoints: String
    {
        case production = "Production"
        case development = "Development"
        case staging = "Staging"
        
        init(string: String?)
        {
            // Set endpoint to development if there is no server
            guard let string = string else { self = .development; return }
            
            self = Endpoints(rawValue: string) ?? .development
        }
        
        var path: String
        {
            switch self
            {
            case .production:
                return "http://Application.com/Scripts/"
            case .development:
                return "http://dev.apppartner.com/Application/Scripts/"
            case .staging:
                return "http://staging.apppartner.com/Application/Scripts"
            }
        }
    }
    
    // MARK: Endpoint Retrieval
    
    var selectedEndpointPath: String
    {
        let defaults = UserDefaults.standard
        let endpointString = defaults.object(forKey: NetworkEndpoint.key) as? String
        
        let endpoint = Endpoints(string: endpointString)
        
        defaults.set(endpoint.rawValue, forKey: NetworkEndpoint.key)
        defaults.synchronize()
        
        return endpoint.path
    }
}

extension URL
{
    var isApplicationEndpoint: Bool
    {
        return self.absoluteString.contains(NetworkEndpoint.shared.selectedEndpointPath)
    }
}
