//
//  FlickrApi.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class FlickrApi {
    
    var networkManager = NetworkManager.shared
    
    func getRecentPhotos(pageSize: String, format: String, success: @escaping NetworkManager.SuccessHandler, failure: @escaping NetworkManager.FailureHandler) {
        let recentPhotosUrl = NetworkUtils.createGetRecentPhotosUrl(apiKey: NetworkConstants.flickrKey, pageSize: pageSize, format: format)
        
        networkManager.getJSONFromRequest(url: recentPhotosUrl, success: success, failure: failure)
    }
    
}
