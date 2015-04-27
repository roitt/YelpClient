//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersViewControllerDelegate {
    let defaultRadius: Int = 10000
    var businesses: [Business]!
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        /* Setup search bar */
        let filterWidth = filterButton.width
        searchBar = UISearchBar(frame: CGRect(x:filterWidth, y:0, width:tableView.frame.width - (filterWidth + 8), height:30))
        searchBar.placeholder = "Search for (tacos, Dominos, etc.)"
        searchBar.userInteractionEnabled = true
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self;
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        performDefaultSearch()
    }
    
    func performDefaultSearch() {
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: [], radius: defaultRadius, deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
    
    func performSearchWithTerm(searchTerm: String) {
        Business.searchWithTerm(searchTerm, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            performDefaultSearch()
        } else {
            println(searchText)
            performSearchWithTerm(searchText)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        println("Hit")
        var ctgrs = filters["categories"] as? [String]
        var rds = filters["radius"] as? Int
        Business.searchWithTerm("Restaurants", sort: nil, categories: ctgrs, radius: rds, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var filtersViewController = segue.destinationViewController as! FiltersViewController
        filtersViewController.delegate = self
    }
}