//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Tomer Buzaglo on 12/04/2016.
//  Copyright © 2016 Tomer Buzaglo. All rights reserved.
//

import UIKit

class WallPaperDetailViewController: UIViewController {

    var data:WallPaper?
    @IBOutlet weak var wallPaperImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        wallPaperImageView?.image = data?.image
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

