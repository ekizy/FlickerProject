//
//  MainInteractor.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation

class MainInteractor {
    
    var flickerAPI: FlickrApi!
    var presenter: MainPresenterProtocol!
    
    init() {
        self.flickerAPI = FlickrApi()
    }

}

extension MainInteractor: MainInteractorProtocol {
    func fetchPhotosFromApi(pageSize: String, format: String) {
        self.flickerAPI.getRecentPhotos(pageSize: pageSize, format: format, success: { (json) in
            let photoContainerModel = PhotosContainerModel(json: json["photos"])
            self.presenter.presentPhotos(photocontainer: photoContainerModel)
        }, failure:  { (errorMessage) in
            //show Error
        })
    }
}
