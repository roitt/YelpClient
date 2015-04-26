//
//  DistanceCell.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class DistanceCell: UITableViewCell {

    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBAction func onSliderValueChanged(sender: AnyObject) {
        var radiusInMetres = round(distanceSlider.value * 20000)
        var radiusInMiles = round(radiusInMetres * 0.000621371)
        distanceLabel.text = "\(radiusInMiles)  mi"    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var defaultDistance = round(distanceSlider.value * 20000 * 0.000621371)
        // Initialization code
        distanceLabel.text = "\(defaultDistance) mi"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}