//
//  ArtistTableViewCell.swift
//  ListToggle
//
//  Created by Mat Schmid on 2018-08-26.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func formatCell() {
        iconImageView.layer.cornerRadius = iconImageView.layer.bounds.size.height / 2
        iconImageView.clipsToBounds = true
        iconImageView.image = UIImage(named: "ninja")
        nameLabel.text = "Artist name"
    }
}
