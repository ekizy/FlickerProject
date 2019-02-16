//
//  NetworkManager.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    typealias SuccessHandler = (_ json: JSON) -> Void
    typealias FailureHandler = (_ error: String) -> Void
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    public func getJSONFromRequest(url: String, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        AF.request(url).responseJSON { (response) in
            do {
                if let data = response.data {
                    let json =  try JSON(data: data)
                    
                    if json["stat"] == "ok" {
                        success(json)
                    } else {
                        failure(json["message"].stringValue)
                    }
                    
                } else {
                    failure("API does not return any data")
                }
            } catch {
                failure("Returned data is not JSON")
            }
            
            return
        }
    }
    
}
