//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Rohit Bhoompally on 4/25/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let numberOfSections = 4;
    @IBAction func onCancelButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func onFiltersFinalized(sender: AnyObject) {
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println(indexPath.row)
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCellWithIdentifier("CategoriesCell", forIndexPath: indexPath) as! CategoriesCell
        case 1:
            return tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! SortCell
        case 2:
            return tableView.dequeueReusableCellWithIdentifier("DistanceCell", forIndexPath: indexPath) as! DistanceCell
        case 3:
            return tableView.dequeueReusableCellWithIdentifier("DealCell", forIndexPath: indexPath) as! DealCell
        default:
            return tableView.dequeueReusableCellWithIdentifier("DealCell", forIndexPath: indexPath) as! DealCell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Categories";
        case 1:
            return "Sort by"
        case 2:
            return "Distance"
        case 3:
            return "Others"
        default:
            println("You should not be here.")
            return "Yelp";
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
