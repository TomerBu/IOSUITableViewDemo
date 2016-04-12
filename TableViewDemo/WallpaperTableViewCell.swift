//
//  WallpaperTableViewCell.swift
//  TableViewDemo
//
//  Created by Tomer Buzaglo on 12/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class WallpaperTableViewCell: UITableViewCell {

    @IBOutlet weak var seasonImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
