//
//  ViewController.swift
//  TableViewsDemo
//
//  Created by Tomer Buzaglo on 8/6/15.
//  Copyright (c) 2015 iTomerBu. All rights reserved.
//

import UIKit

class DataSource {
    
    /*
     var images = ["12-December", "01-January", "02-February", "03-March", "04-April", "05-May", "06-June", "07-July", "08-August" , "09-September", "10-October", "11-November" ]
     
     Winter - Dec / Jan / Feb
     Spring - Mar / Apr / May
     Summer - June / July Aug
     Fall - Sept / Oct / Nov
     */
    
    var data: [Int:[WallPaper]]
    var headerImages:[UIImage]
    init (){
        data = [Int:[WallPaper]]()
        
        let dec = WallPaper(title: "December", subTitle: "Winter", image: "12-December")
        let jan = WallPaper(title: "January", subTitle: "Winter", image: "01-January")
        let feb = WallPaper(title: "February", subTitle: "Winter", image: "02-February")
        
        data[0] = [dec, jan, feb]
        
        let march = WallPaper(title: "March", subTitle: "Spring", image: "03-March")
        let apr = WallPaper(title: "April", subTitle: "Spring", image: "04-April")
        let may = WallPaper(title: "May", subTitle: "Spring", image:
            "05-May")
        
        
        data[1] = [march, apr, may]
        
        let june = WallPaper(title: "June", subTitle: "Summer", image: "06-June")
        let july = WallPaper(title: "July", subTitle: "Summer", image: "07-July")
        let aug = WallPaper(title: "August", subTitle: "Summer", image:
            "08-August")
        
        
        data[2] = [june, july, aug]
        
        
        let sept = WallPaper(title: "September", subTitle: "Fall", image: "09-September")
        let oct = WallPaper(title: "October", subTitle: "Fall", image: "10-October")
        let nov = WallPaper(title: "November", subTitle: "Fall", image:
            "11-November")
        
        
        data[3] = [sept, oct, nov]
        
        let headerImageNames = ["Winter", "Spring", "Summer", "Fall"]
        
        headerImages = headerImageNames.map({ (name) -> UIImage in
            return UIImage(named: name)!
        })
    }
    
    func numberOfSectionsInData()->Int{
        return data.count
    }
    
    func numberOfRowsInSection(section: Int)->Int{
        return data[section]?.count ?? 0
    }
    
    func wallPaperForRowAtIndexPath(indexPath: NSIndexPath)->WallPaper?{
        let section = indexPath.section
        let row = indexPath.row
        return data[section]?[row]
    }
    
    func headerForSection(section:Int)-> UIImage{
        return headerImages[section]
    }
    
    func deleteRowsAtIndexPath(indexPath:NSIndexPath){
        data[indexPath.section]?.removeAtIndex(indexPath.row)
    }
    
    func insertRowsAtIndexPath(indexPath:NSIndexPath, wallPaper:WallPaper){
        data[indexPath.section]?.insert(wallPaper, atIndex: indexPath.row)
    }
}

