//
//  FlickrImageCollectionViewCell.swift
//  CVSDemo
//
//  Created by Martin Chibwe on 2/14/22.
//

import UIKit

final class FlickrImageTableViewCell: UITableViewCell{
    @IBOutlet weak var flickrIamgeView: UIImageView!
    @IBOutlet weak var flickrTitleLabel: UILabel!
    @IBOutlet weak var flickrAuthorLabel: UILabel!
    @IBOutlet weak var flickrPublishedLabel: UILabel!
    @IBOutlet weak var flickrWidthLabel: UILabel!
    @IBOutlet weak var flickrHeightLabel: UILabel!
    
    func configureCell(with flickrItem: FlickrViewModel) {
        setupCell(with: flickrItem)
        setupAccessibility(flickrItem)
    }
}

extension FlickrImageTableViewCell {
    func setupCell(with flickrItem: FlickrViewModel) {
        flickrTitleLabel.text = flickrItem.photoTitle
        flickrPublishedLabel.text = flickrItem.published
        flickrWidthLabel.text = flickrItem.width
        flickrHeightLabel.text = flickrItem.height
        flickrAuthorLabel.text = flickrItem.author
        if let url = URL(string: flickrItem.media) {
            flickrIamgeView.kf.setImage(with: url)
        }
        else {
            flickrIamgeView.image = UIImage(named: "dummy")
        }
    }
    
    func setupAccessibility(_ flickrItem: FlickrViewModel) {
        flickrIamgeView.accessibilityTraits = UIAccessibilityTraits.image
        flickrIamgeView.accessibilityLabel = flickrItem.photoTitle
        flickrTitleLabel.isAccessibilityElement = true
        flickrTitleLabel.accessibilityTraits =  UIAccessibilityTraits.none
        
        flickrAuthorLabel.accessibilityLabel = flickrItem.author
        flickrAuthorLabel.isAccessibilityElement = true
        flickrAuthorLabel.accessibilityTraits =  UIAccessibilityTraits.none
        
        flickrPublishedLabel.accessibilityLabel = flickrItem.published
        flickrPublishedLabel.isAccessibilityElement = true
        flickrPublishedLabel.accessibilityTraits =  UIAccessibilityTraits.none
    }
}
