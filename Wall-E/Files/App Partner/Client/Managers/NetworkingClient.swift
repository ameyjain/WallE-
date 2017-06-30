//
//  NetworkingClient.swift
//  Template
//
//  Created by App Partner on 5/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient: NSObject
{    
    @objc enum RequestMethod: Int
    {
        case GET
        case POST
        
        var converted: HTTPMethod
        {
            switch self
            {
            case .GET:
                return .get
            case .POST:
                return .post
            }
        }
    }
    
    @objc enum MediaType: Int
    {
        case Image
        case Video
        
        var converted: String
        {
            switch self
            {
            case .Image:
                return "image/jpeg"
            case .Video:
                return "video/mp4"
            }
        }
    }
    
    // MARK: Requests
    @discardableResult
    static func request(method: RequestMethod = .GET, urlString: String?, parameters: [String: Any]?, withSuccess: @escaping DictionaryCompletionBlock, withError: @escaping ErrorCompletionBlock) -> NetworkRequest?
    {
        guard let urlString = urlString,
              let url = URL(path: urlString) else
        {
            let error = NSError.with(message: "URL cannot be empty")
            Logger.log("Error: " + error.localizedDescription, type: .error)

            withError(error)
            return nil
        }
        
        // Add User token to parameters
        var finalParameters = parameters ?? [:]
        
        if let user = UserManager.shared.currentUser,
           url.isApplicationEndpoint
        {
            finalParameters["user_token"] = user.userToken
        }
        
        let request = Alamofire.request(url, method: method.converted, parameters: finalParameters)
        request.responseJSON
        { response in
            
            Logger.log("Request: " + response.toRequestString(), type: .networking)
            
            switch response.result
            {
            case .success:
                
                //1. Make sure we received valid JSON
                guard let jsonDict = response.result.value as? [String: Any] else
                {
                    let error = response.error ?? NSError.unknownError
                    Logger.log("Error: " + error.localizedDescription, type: .error)
                    withError(error)
                    return
                }
                
                Logger.log("Response (JSON): \(jsonDict)", type: .networking)
                
                //2. Check if JSON is not an error
                if let error = NSError.from(dictionary: jsonDict)
                {
                    Logger.log("Error: " + error.localizedDescription, type: .error)
                    withError(error)
                    return
                }
                
                //3. Success
                withSuccess(jsonDict)
                
            case .failure(let error):
                Logger.log("Error: " + error.localizedDescription, type:. error)
                withError(error)
            }
        }
        
        let networkRequest = NetworkRequest(dataRequest: request)
        
        return networkRequest
    }
    
    static func upload(urlString: String, data: Data, fileName: String, parameters: [String: Any], mediaType: MediaType, progressBlock: ProgressCompletionBlock?, completion: GenericCompletionBlock?)
    {
        guard let url = URL(path: urlString) else
        {
            completion?(false, NSError.with(message: "URL is not valid"))
            return
        }
        
        // Add User token to parameters
        var finalParameters = parameters
        finalParameters["user_token"] = "super_token"
        
        Alamofire.upload(multipartFormData:
        { multipartFormData in
            //Make sure withName parameter is equal to the parameter we are checking on the backend
            multipartFormData.append(data, withName: "file", fileName: fileName, mimeType: mediaType.converted)
            for (key, value) in finalParameters
            {
                let valueString = String(describing: value)
                
                if let paramData = valueString.data(using: .utf8)
                {
                    multipartFormData.append(paramData, withName: key)
                }
            }
        }, to: url)
        { (result) in
            
            switch result
            {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure:
                { (progress) in
                    Logger.log("Upload Progress: \(progress.fractionCompleted)")
                    progressBlock?(CGFloat(progress.fractionCompleted))
                })
                
                upload.validate(statusCode: 200..<300)
                      .responseJSON
                { response in
                    
                    guard let responseValue = response.result.value
                    else
                    {
                        completion?(false, NSError.with(message: "Failed to parse JSON"))
                        return
                    }
                    //TODO: Handle response
                    Logger.log(responseValue)
                    completion?(response.result.isSuccess, nil)
                }
                
            case .failure(let encodingError):
                Logger.log(encodingError, type: .error)
                completion?(false, encodingError)
            }
        }
    }
}


fileprivate extension DataResponse where Value == Any
{
    func toRequestString() -> String
    {
        guard let request = self.request,
            let urlString = request.url?.absoluteString else
        {
            return "<null>"
        }
        
        guard let parametersData = request.httpBody,
            let parametersString = String(data: parametersData, encoding: .utf8)
            else
        {
            return urlString
        }
        
        return urlString + "?" + parametersString
    }
}

fileprivate extension URL
{
    init?(path: String)
    {
        guard let url = URL(string: path) else
        {
            return nil
        }
        
        // Add basepath to url if needed
        let finalPath = url.scheme == nil ? NetworkEndpoint.shared.selectedEndpointPath + path :
                                            path
        guard let finalURL = URL(string: finalPath) else
        {
            return nil
        }
        
        self = finalURL
    }
}
