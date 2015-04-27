//
//  SortCell.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/25/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SortCell: UITableViewCell {
    
    let sortTerms = ["Best Matched", "Distance", "Highest Rated"]
    
    @IBOutlet weak var sortLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
