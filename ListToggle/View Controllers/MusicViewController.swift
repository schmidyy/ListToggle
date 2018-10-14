//
//  MusicViewController.swift
//  ListToggle
//
//  Created by Mat Schmid on 2018-08-25.
//  Copyright © 2018 Mat Schmid. All rights reserved.
//

import UIKit

class CustomImage: UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 45, height: 45)
    }
}

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var iconsStackView: UIStackView!
    @IBOutlet weak var iconViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var artistsTableView: UITableView!
    @IBOutlet weak var toggleExpansionButton: UIButton!
    @IBOutlet weak var topArtistView: UIView!
    @IBOutlet weak var trackCollectionView: UICollectionView!
    @IBOutlet weak var summerTracksView: UIView!
    
    var isHorizontalStack: Bool {
        return iconsStackView.axis == .horizontal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistsTableView.alpha = 0
        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        
        trackCollectionView.delegate = self
        trackCollectionView.dataSource = self
        
        setupUI()
    }
    
    private func setupUI() {
        for image in iconsStackView.arrangedSubviews {
            image.layer.cornerRadius = image.bounds.size.height / 2
            image.clipsToBounds = true
        }
        
        iconsStackView.alignment = .leading
        iconViewWidthConstraint.constant = UIScreen.main.bounds.width - 32
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isHorizontalStack {
            iconViewHeightConstraint.constant = 400
            iconViewWidthConstraint.constant = 82
            iconsStackView.axis = .vertical
            iconsStackView.distribution = .fillEqually
            iconsStackView.spacing = 20
            summerTracksView.isHidden = true
        } else {
            iconViewHeightConstraint.constant = 125
            iconViewWidthConstraint.constant = UIScreen.main.bounds.width - 32
            iconsStackView.axis = .horizontal
            iconsStackView.distribution = .equalSpacing
            artistsTableView.alpha = 0
            summerTracksView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { _ in
            self.toggleExpansionButton.titleLabel?.text = self.isHorizontalStack ? "More Info" : "Close"
            if !self.isHorizontalStack {
                UIView.animate(withDuration: 0.3, animations: {
                    self.artistsTableView.alpha = 1
                    
                })
            }
        }
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath) as! ArtistTableViewCell
        cell.formatCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trackCell", for: indexPath) as! TrackCollectionViewCell
        cell.formatCell()
        return cell
    }
}
