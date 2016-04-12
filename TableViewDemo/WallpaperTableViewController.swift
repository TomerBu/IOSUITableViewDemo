//
//  WallpaperTableViewController.swift
//  TableViewDemo
//
//  Created by Tomer Buzaglo on 12/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class WallpaperTableViewController: UITableViewController {
    
    
    var dataSource = DataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SeasonSectionHeaderView", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "SeasonSectionHeaderView")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(addTapped))
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull To Refresh!")
        self.refreshControl = UIRefreshControl()
        
        self.tableView.addSubview(self.refreshControl!) // not required when using UITableViewController
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func addTapped(sender:UIBarButtonItem){
        var randSection = 0
        arc4random_buf(&randSection, sizeof(Int))
        randSection = abs(randSection % dataSource.numberOfSectionsInData())
        
        var randRow = 0
        arc4random_buf(&randRow, sizeof(Int))
        randRow = abs(randRow % dataSource.numberOfRowsInSection(randSection))
        
        let indexPath = NSIndexPath(forItem: randRow, inSection: randSection)
        if let paper = dataSource.wallPaperForRowAtIndexPath(indexPath){
            dataSource.data[0]?.append(paper)
            let iPath = NSIndexPath(forRow: dataSource.data[0]!.count - 1, inSection: 0)
            tableView.insertRowsAtIndexPaths([iPath], withRowAnimation: .Left)
        }
        
    }
    
    func refresh(refreshControl:UIRefreshControl){
        dataSource = DataSource()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.numberOfSectionsInData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.numberOfRowsInSection(section)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wallPaperCell", forIndexPath: indexPath) as! WallpaperTableViewCell
        
        // Configure the cell...
        
        if let wallPaper = dataSource.wallPaperForRowAtIndexPath(indexPath){
            cell.seasonImageView.image = wallPaper.image
            cell.paperTitleLabel.text = wallPaper.title
            cell.paperSubTitleLabel.text = wallPaper.subTitle
            
            //cell.backgroundImageView.image = wallPaper.image
            
            UIView.transitionWithView(cell.backgroundImageView, duration: 1.3, options: .TransitionCurlUp, animations: {
                cell.backgroundImageView.image = wallPaper.image
                }, completion: nil)
            
            
            
            
            
            //            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0), {
            //
            //                let image = wallPaper.image
            //                let filter = CIFilter(name: "CIAreaAverage")! //"CIBoxBlur","CIColumnAverage", "CIAreaAverage", "CICrystallize", "CIComicEffect", "CIPhotoEffectChrome", "CIPhotoEffectTonal", "CICircularWrap" ,"CIPhotoEffectTransfer", "CISepiaTone", "CIVignette", "CIVignetteEffect"
            //                let cgImage = CIImage(image: image)
            //                filter.setValue(cgImage, forKey: kCIInputImageKey)
            //                let cgimg:CGImage = CIContext().createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent)
            //
            //                let processedImage = UIImage(CGImage: cgimg)
            //                dispatch_async(dispatch_get_main_queue(), {
            //
            //                    UIView.transitionWithView(cell.backgroundImageView, duration: 0.5, options: .TransitionCrossDissolve, animations: {
            //                         cell.backgroundImageView.image = processedImage
            //                        }, completion: nil)
            //
            //                })
            //            })
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let btnKill = UITableViewRowAction(style: .Default, title: "Kill!", handler: { (action, indexPath) in
            self.tableView(tableView, commitEditingStyle: UITableViewCellEditingStyle.Delete, forRowAtIndexPath: indexPath)
        })
        btnKill.backgroundColor = UIColor.redColor()
        let btnKeep = UITableViewRowAction(style: .Default, title: "Keep!", handler: { (action, indexPath) in
            print("Keeper :)")
            tableView.editing = false
        })
        btnKeep.backgroundColor = UIColor.greenColor()
        return [btnKill, btnKeep]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("SeasonSectionHeaderView") as! SeasonSectionHeaderView
        
        header.seasonImageView.image = dataSource.headerForSection(section)
        return header
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (dataSource.wallPaperForRowAtIndexPath(indexPath)?.image.size.height)! / 3
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.deleteRowsAtIndexPath(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if let from = dataSource.wallPaperForRowAtIndexPath(fromIndexPath){
            dataSource.deleteRowsAtIndexPath(fromIndexPath)
            dataSource.insertRowsAtIndexPath(toIndexPath, wallPaper: from)
        }
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let paper = dataSource.wallPaperForRowAtIndexPath(indexPath){
            performSegueWithIdentifier("wallPaperMasterToDetail", sender: paper)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let dest = segue.destinationViewController as? WallPaperDetailViewController{
            dest.data = (sender as? WallPaper)
        }
    }
    
    
}
