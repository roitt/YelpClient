//
//  DealCell.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/25/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol DealCellDelegate {
    optional func dealCell(dealCell: DealCell, didValueChange value: Bool)
}

class DealCell: UITableViewCell {
    

    @IBOutlet weak var dealSwitch: UISwitch!
    weak var delegate: DealCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onSwitchValueChanged(sender: AnyObject) {
        delegate?.dealCell?(self, didValueChange: dealSwitch.on)
    }
}
