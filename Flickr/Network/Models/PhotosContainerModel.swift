//
//  PhotosContainerModel.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhotosContainerModel {
    
    var page: Int!
    var pages: Int!
    var perpage: Int!
    var total: Int!
    
    var photos: [PhotoModel]?
    
    init(json: JSON) {        
        self.page = json["page"].int
        self.pages = json["pages"].int
        self.perpage = json["perpage"].int
        self.total = json["total"].int
        
        self.photos = [PhotoModel]()
        
        if let photosJSON = json["photo"].array {
            for photoJSON in photosJSON {
                let photoModel = PhotoModel(json: photoJSON)
                self.photos?.append(photoModel)
            }
        }
        
    }
    
}
