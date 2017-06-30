//
//  VideoManager.swift
//  Template
//
//  Created by Mike Lepore on 6/22/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class VideoManager: NSObject {
    
    static func saveToServer(videoURLPath: URL, progressBlock: ProgressCompletionBlock?, completion: GenericCompletionBlock?)
    {
        // Must have
        guard let videoData = try? Data(contentsOf: videoURLPath) else {
            completion?(false, NSError.with(message: "Could not upload from given path."))
            return
        }
        
        VideoManager.saveToServer(videoData: videoData, progressBlock: progressBlock, completion: completion)
    }
    
    static func saveToServer(videoData: Data, progressBlock: ProgressCompletionBlock?, completion: GenericCompletionBlock?)
    {
        /*
         // Must have a user id
         guard let user = UserManager.shared.currentUser else {
         completion?(false, NSError.with(message: "Invalid user"))
         return
         }*/
        
        // Make upload request
        //let parameters = ["requesting_user_id": user.userId]
        let parameters = ["requesting_user_id": "1"]
        NetworkingClient.upload(urlString: "upload-video.php", data: videoData, fileName: "videoTest", parameters: parameters, mediaType: NetworkingClient.MediaType.Video, progressBlock: progressBlock, completion: completion)
    }
}
