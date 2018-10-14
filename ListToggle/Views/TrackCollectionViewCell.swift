//
//  TrackCollectionViewCell.swift
//  ListToggle
//
//  Created by Mat Schmid on 2018-08-27.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var artworkImageView: UIImageView!
    
    func formatCell() {
        artworkImageView.image = UIImage(named: "ninja")
    }
}
