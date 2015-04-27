//
//  CategoriesCell.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/26/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol CategoriesCellDelegate {
    optional func categoriesCell(categoriesCell: CategoriesCell, didChangeValue value: Bool)
}

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoriesSwitch: UISwitch!
    
    weak var delegate: CategoriesCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onSwitchValueChanged(sender: AnyObject) {
        delegate?.categoriesCell?(self, didChangeValue: categoriesSwitch.on)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
