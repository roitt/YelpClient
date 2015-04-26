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
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
