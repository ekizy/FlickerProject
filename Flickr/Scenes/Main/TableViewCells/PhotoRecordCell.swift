//
//  PhotoRecordCell.swift
//  Flickr
//
//  Created by Yusuf Ekiz on 16.02.2019.
//  Copyright © 2019 Yusuf Ekiz. All rights reserved.
//

import UIKit

class PhotoRecordCell: UITableViewCell {

    @IBOutlet weak var photoImageView: FlickrImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var uploadDataLabel: UILabel!
    @IBOutlet weak var dateTakenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
