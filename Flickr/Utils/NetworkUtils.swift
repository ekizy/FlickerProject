//
//  NetworkUtils.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation

class NetworkUtils {

    static func createPhotoUrl(photoModel: PhotoModel) -> String {
        let farmId: String = String(photoModel.farm)
        let serverId: String = photoModel.server
        let photoId: String = photoModel.id
        let secret: String = photoModel.secret
        
        return "https://farm\(farmId).staticflickr.com/\(serverId)/\(photoId)_\(secret).jpg"
    }
    
    static func createGetRecentPhotosUrl(apiKey: String, pageSize: String, format: String) -> String {
        return NetworkConstants.getRecent + "&api_key=\(apiKey)&per_page=\(pageSize)&format=\(format)&nojsoncallback=1&extras=date_upload,date_taken,owner_name"
    }
    
    
}
