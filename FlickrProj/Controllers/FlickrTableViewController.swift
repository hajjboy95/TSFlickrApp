//
//  ViewController.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import UIKit

class FlickrTableViewController: UIViewController {

    
    var flickrTableDataSource = [Flickr]()
    var flickrFactory = FlickrFactory(numberOfFlickrObjects: 30)
    let fapi = FlickrApi()

    override func viewDidLoad() {
        super.viewDidLoad()

        flickrTableDataSource =  flickrFactory.createFlickrInstaces()
        

        fapi.getFlickrData { (dic, error) -> Void in
            
            if error != nil {
                print("ERROR HAS OCCURED \(error)")
            } else {
            
                print(dic)
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FlickrTableViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flickrTableDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FlickrCell") as UITableViewCell!
        let cellInfo = flickrTableDataSource[indexPath.row]
        
        
        cell.textLabel?.text = "\(indexPath.row) \(cellInfo.title!)"
        cell.detailTextLabel?.text = "\(cellInfo.desription!)"
        cell.imageView?.image = UIImage(named: "placeholder")
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}




