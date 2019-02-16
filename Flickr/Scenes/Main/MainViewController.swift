//
//  ViewController.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    @IBOutlet weak var recentPhotosTableView: UITableView!
    
    var presenter: MainPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FlickrApp"
        self.navigationController?.isNavigationBarHidden = false
        recentPhotosTableView.delegate = self
        recentPhotosTableView.dataSource = self
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getPhotosFromApi()
    }
    
    func initComponents() {
        let presenter = MainPresenter()
         let interactor = MainInteractor()
         presenter.interactor = interactor
         presenter.viewController = self
         interactor.presenter = presenter
         self.presenter = presenter
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let expandedImageView = UIImageView(image: imageView.image)
        expandedImageView.frame = UIScreen.main.bounds
        expandedImageView.backgroundColor = UIColor.white
        expandedImageView.contentMode = .scaleAspectFill
        expandedImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage(sender:)))
        expandedImageView.addGestureRecognizer(tap)
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(expandedImageView)
    }
    
    @objc func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        sender.view?.removeFromSuperview()
    }
    
}

extension MainViewController: MainViewControllerProtocol {
    
    func showPhotos() {
        self.recentPhotosTableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.photos?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoRecordCell", for: indexPath) as? PhotoRecordCell else {
            fatalError()
        }
        
        if let photoModel = self.presenter.photos?[indexPath.row] {
            let photoUrl = URL(string: NetworkUtils.createPhotoUrl(photoModel: photoModel))
            cell.photoImageView.kf.setImage(with: photoUrl)
            let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:)))
            cell.photoImageView.addGestureRecognizer(tap)
            cell.photoImageView.isUserInteractionEnabled = true
            cell.userNameLabel.text = photoModel.ownerName
            cell.dateTakenLabel.text = DateUtils.getDayFromDateString(dateString: photoModel.dateTaken)
            cell.uploadDataLabel.text = DateUtils.convertTimeStampToDateString(timeStamp: photoModel.dateUpload)
            cell.selectionStyle = .none
        }
    
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
