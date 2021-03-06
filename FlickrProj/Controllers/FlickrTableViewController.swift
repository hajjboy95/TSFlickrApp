//
//  ViewController.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import UIKit

class FlickrTableViewController: UITableViewController {
    
    
    
    var flickrTableDataSource :[Flickr]!
    var flickrFactory:FlickrFactory!
    var flickrApi:FlickrApi!
    var cache:NSCache!
    var task: NSURLSessionDownloadTask!
    var session: NSURLSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 200.0; // set to whatever your "average" cell height is
        
        
        intialiseObjects()
        
        flickrTableDataSource =  flickrFactory.createFlickrInstaces()
        
        
        flickrApi.getFlickrData { (dic, error) -> Void in
            
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
        flickrApi = FlickrApi()
        cache = NSCache()
        session = NSURLSession.sharedSession()
        task = NSURLSessionDownloadTask()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    Isn't being automatically triggered from tableview
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier ?? "" {
            
        case Constants.FlickrTableViewToDetailViewSegue:
            
            let detailVC  = segue.destinationViewController as! DetailViewController
            let indexPath = sender as! NSIndexPath
            
            let info = flickrTableDataSource[indexPath.row]
            let image = cache.objectForKey(info.date_taken!) as? UIImage
            let description =  info.desription
            let tag = info.tags
            
            detailVC.detailDescription = description
            detailVC.detailImage = image
            detailVC.detailTag = tag
            
            
            
            
        default:
            print("Error has occured")
            
        }
    }
    
}

//Extension to help with the PrepareForSegue
extension FlickrTableViewController  {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Constants.FlickrTableViewToDetailViewSegue, sender: indexPath)
        
        
    }
}

extension FlickrTableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flickrTableDataSource.count
    }
    
    
    
    
    /**
     This functoin displays the cells in the tableView .
     
     Checks if the image is present in the NSCache variable first.
     the key is the dataTaken varaible . if present dontbmake a netweok request and display the 
     image within the cache 
     
     if its not present in the cache call the flickr api object to download the image with the given
     url and update the ui when the image is recieved .
     
     as the image is being downlaoded from the server the user cannot click into the cell and a 
     placeholder is displayed in the meantime
     
     
     
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.FlickrTableViewCellIdentifier) as! FlickrTableViewCell
        let cellInfo = flickrTableDataSource[indexPath.row]
        
        cell.cellInfo = cellInfo
        
        let date_taken = cellInfo.date_taken
        let media = cellInfo.media
        
        // check if the image is already present in the cache
        if let img = cache.objectForKey(date_taken!) {
            cell.mainImageView?.image = img as? UIImage
        }
            
            // set placeholder image , make network request then set image in cache
        else {
            cell.mainImageView?.image = UIImage(named: "placeholder")
            cell.userInteractionEnabled = false
            
            flickrApi.downloadFlickrImage(media! , completion: {  (image, error) -> Void in
                
                print("media! = \(media!)")
                if error != nil {
                    print(error)
                } else {
                    let updateCell  = tableView.cellForRowAtIndexPath(indexPath) as? FlickrTableViewCell
                    updateCell?.mainImageView?.image = image
                    cell.userInteractionEnabled = true
                    
                    self.cache.setObject(image!, forKey: date_taken!)
                }
            })
        }
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}




