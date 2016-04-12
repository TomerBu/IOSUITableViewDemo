//
//  WallPaper.swift
//  TableViewDemo
//
//  Created by NessCollege IT on 8/6/15.
//  Copyright (c) 2015 NessCollege IT. All rights reserved.
//

import UIKit

class WallPaper {
    
    var title:String
    var subTitle:String
    var image:UIImage
    
    init(title:String, subTitle:String, image:String){
        self.title = title
        self.subTitle = subTitle
        self.image = UIImage(named: image)!
    }
}
