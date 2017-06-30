//
//  NetworkRequest.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/28/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation
import Alamofire

class NetworkRequest: NSObject
{
    // MARK: Properties
    let dataRequest: DataRequest
    
    /// The number of times the request has been retried.
    var retryCount: UInt { return self.dataRequest.retryCount }
    
    /// The underlying task.
    var task: URLSessionTask? { return self.dataRequest.task }
    
    /// The session belonging to the underlying task.
    var session: URLSession { return self.dataRequest.session }
    
    /// The request sent or to be sent to the server.
    var request: URLRequest? { return self.dataRequest.request }
    
    /// The response received from the server, if any.
    var response: HTTPURLResponse? { return self.dataRequest.response }
    
    //MARK:  Init
    
    init(dataRequest: DataRequest)
    {
        self.dataRequest = dataRequest
        super.init()
    }
    
    // MARK: State
    
    /// Resumes the request.
    func resume()
    {
        self.dataRequest.resume()
    }
    
    /// Suspends the request.
    func suspend()
    {
       self.dataRequest.suspend()
    }
    
    /// Cancels the request.
    open func cancel()
    {
        self.dataRequest.cancel()
    }
}
