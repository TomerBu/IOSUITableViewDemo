//
//  WallpaperTableViewCell.swift
//  TableViewDemo
//
//  Created by Tomer Buzaglo on 12/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class WallpaperTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var seasonImageView: UIImageView!{
        didSet{
            seasonImageView.layer.cornerRadius = 5
            seasonImageView.layer.borderWidth = 1
            seasonImageView.layer.borderColor = UIColor.grayColor().colorWithAlphaComponent(0.2).CGColor
        }
    }

    @IBOutlet weak var paperTitleLabel: UILabel!
    
    @IBOutlet weak var paperSubTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
