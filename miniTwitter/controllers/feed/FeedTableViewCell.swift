//
//  FeedTableViewCell.swift
//  miniTwitter
//
//  Created by kulraj singh on 20/01/23.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        innerView.dropShadow()
    }
    
    var tweet: Tweet? {
        didSet {
            tweetTextLabel.text = tweet?.text
            if let type = tweet?.media?.type,
               type == .photo {
                let height = tweet?.media?.height ?? 0
                //limit the height
                imageHeight.constant = height > 200 ? 200 : height
                mediaImage.isHidden = false
                mediaImage.image = UIImage(named: "placeholder")
                mediaImage.downloaded(from: tweet?.media?.url)
            } else {
                mediaImage.isHidden = true
            }
            
        }
    }
    
}