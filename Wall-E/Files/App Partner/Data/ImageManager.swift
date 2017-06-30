//
//  ImageManager.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/24/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit
import SDWebImage

class ImageManager: NSObject
{
    fileprivate struct DefaultSettings
    {
        static let cacheByDefault = true
        static let refreshCached = false
    }
    
    private override init() {}
    
    static func saveToServer(imageData: ImageData, progressBlock: ProgressCompletionBlock?, completion: GenericCompletionBlock?)
    {
        let parameters = ["requesting_user_id": imageData.userId]
        
        NetworkingClient.upload(urlString: "upload-image.php", data: imageData.imageData, fileName: imageData.imageName, parameters: parameters, mediaType: NetworkingClient.MediaType.Image, progressBlock: progressBlock, completion: completion)
    }
}

internal extension UIImageView
{
    func setImage(url: URL?)
    {
        self.setImage(url: url, withPlaceHolder: nil, refreshCached: ImageManager.DefaultSettings.cacheByDefault)
    }
    
    func setImage(url: URL?, withPlaceHolder placeHolder: String)
    {
        self.setImage(url: url, withPlaceHolder: placeHolder, refreshCached: ImageManager.DefaultSettings.cacheByDefault)
    }
    
    func setImage(url: URL?, refreshCached: Bool)
    {
        self.setImage(url: url, withPlaceHolder: nil, refreshCached: refreshCached)
    }
    
    func setImage(url: URL?, withPlaceHolder placeHolder: String?, refreshCached: Bool)
    {
        let image = (placeHolder != nil) ? UIImage(named: placeHolder!) : nil
        
        var options: SDWebImageOptions = refreshCached ? [] : [.refreshCached]
        if !ImageManager.DefaultSettings.cacheByDefault
        {
            options.update(with: .cacheMemoryOnly)
        }
        
        self.sd_setImage(with: url, placeholderImage: image, options: options)
    }
}

