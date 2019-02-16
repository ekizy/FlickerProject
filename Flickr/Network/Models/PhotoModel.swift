//
//  PhotoModel.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhotoModel {
    
    var id: String!
    var owner: String!
    var secret: String!
    var server: String!
    var farm: Int!
    var title: String!
    var isPublic: Int!
    var isFriend: Int!
    var isFamily: Int!
    var dateUpload: String!
    var dateTaken: String!
    var ownerName: String!
    
    init(json: JSON) {
        self.id = json["id"].string
        self.owner = json["owner"].string
        self.secret = json["secret"].string
        self.server = json["server"].string
        self.farm = json["farm"].int
        self.title = json["title"].string
        self.isPublic = json["ispublic"].int
        self.isFriend = json["isfriend"].int
        self.isFamily = json["isfamily"].int
        self.dateUpload = json["dateupload"].string
        self.dateTaken = json["datetaken"].string
        self.ownerName = json["ownername"].string
    }
}
