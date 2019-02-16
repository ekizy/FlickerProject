//
//  MainProtocols.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {
    
    func presentPhotos(photocontainer: PhotosContainerModel)
    
    func getPhotosFromApi()
    
    var photos: [PhotoModel]? { get set }
    
}

protocol MainInteractorProtocol {
    
    func fetchPhotosFromApi(pageSize: String, format: String)
}

protocol MainViewControllerProtocol {
    
    func showPhotos()
    
}
