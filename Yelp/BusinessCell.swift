//
//  BusinessCell.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/25/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var bnsImgView: UIImageView!
    @IBOutlet weak var bnsNameLabel: UILabel!
    @IBOutlet weak var bnsDistanceLabel: UILabel!
    @IBOutlet weak var bnsNumberOfReviewsLabel: UILabel!
    @IBOutlet weak var bnsPriceLabel: UILabel!
    @IBOutlet weak var bnsAddressLabel: UILabel!
    @IBOutlet weak var bnsAttributesLabel: UILabel!
    @IBOutlet weak var bnsRatingImgView: UIImageView!
    
    var business: Business! {
        didSet {
            bnsNameLabel.text = business.name
            
            // Set Image with a fade-in effect
            if (business.imageURL != nil) {
                var urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: business.imageURL!)
                bnsImgView.setImageWithURLRequest(urlRequest, placeholderImage: nil, success: { (request:NSURLRequest!, response:NSHTTPURLResponse!, image:UIImage!) -> Void in
                    if urlRequest != request {
                        self.bnsImgView.image = image
                    } else {
                        UIView.transitionWithView(self.bnsImgView, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                            self.bnsImgView.image = image
                            }, completion: nil)
                    }
                    }) { (request:NSURLRequest!, response:NSHTTPURLResponse!, error:NSError!) -> Void in
                }
            }
            
            // Set other label properties
            bnsAttributesLabel.text = business.categories
            bnsAddressLabel.text = business.address
            bnsDistanceLabel.text = business.distance
            bnsNumberOfReviewsLabel.text = "\(business.reviewCount!) Reviews"
            bnsRatingImgView.setImageWithURL(business.ratingImageURL)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Make the corners rounded
        bnsImgView.layer.cornerRadius = 4
        
        // Clip the bitmap
        bnsImgView.clipsToBounds = true
        
        // Fix the bug where the label doesn't wrap to next line
        bnsNameLabel.preferredMaxLayoutWidth = bnsNameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Fix the bug where the label doesn't wrap to next line
        bnsNameLabel.preferredMaxLayoutWidth = bnsNameLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
