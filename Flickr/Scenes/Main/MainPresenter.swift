//
//  MainPresenter.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import Foundation


class MainPresenter {
    
    var interactor: MainInteractorProtocol!
    var viewController: MainViewControllerProtocol!
    var photos: [PhotoModel]?
}

extension MainPresenter: MainPresenterProtocol {
    
    func presentPhotos(photocontainer: PhotosContainerModel) {
        self.photos = photocontainer.photos
        viewController.showPhotos()
    }
    
    func getPhotosFromApi() {
        interactor.fetchPhotosFromApi(pageSize: "10", format: "json")
    }

}
