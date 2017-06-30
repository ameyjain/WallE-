//
//  ImageData.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/1/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

class ImageData: NSObject
{
    let image: UIImage
    let userId: Int
    let imageData: Data
    let imageName: String
    
    init?(image: UIImage, userId: Int, imageName: String? = nil)
    {
        guard let data = UIImageJPEGRepresentation(image, 0.75) else
        {
            return nil
        }
        self.image = image
        self.userId = userId
        self.imageName = imageName ?? (String(Date.timeIntervalSinceReferenceDate) + "_" + String(userId))
        self.imageData = data
        
        super.init()
    }
}
