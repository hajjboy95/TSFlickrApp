//
//  ViewController.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import UIKit

class FlickrTableViewController: UIViewController {



    var flickrTableDataSource :[Flickr]!
    var flickrFactory:FlickrFactory!
    var fapi:FlickrApi!
    var cache:NSCache!
    var task: NSURLSessionDownloadTask!
    var session: NSURLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intialiseObjects()

        flickrTableDataSource =  flickrFactory.createFlickrInstaces()
        

        fapi.getFlickrData { (dic, error) -> Void in
            
            if error != nil {
                print("ERROR HAS OCCURED \(error)")
            } else {
            
                print(dic)
            }
            
        }
    }
    
    private func intialiseObjects(){
        
        flickrTableDataSource = [Flickr]()
        flickrFactory = FlickrFactory(numberOfFlickrObjects: 30)
        fapi = FlickrApi()
        cache = NSCache()
        session = NSURLSession.sharedSession()
        task = NSURLSessionDownloadTask()


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
        
        let title = cellInfo.title
        let desc  = cellInfo.desription
        let media = cellInfo.media
        let date_taken = cellInfo.date_taken
        
        
        cell.textLabel?.text = "\(indexPath.row) \(title!)"
        cell.detailTextLabel?.text = "\(desc!)"
        
//        Check if the image is already present in the cache
        
        
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}



//if let img = cache.objectForKey(date_taken!) {
//    cell.imageView?.image = img as! UIImage
//}
//    //        set placeholder image , make netwrok request
//else {
//
//}

