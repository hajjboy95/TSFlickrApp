//
//  ViewController.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import UIKit

class FlickrTableViewController: UIViewController , UITableViewDelegate{



    var flickrTableDataSource :[Flickr]!
    var flickrFactory:FlickrFactory!
    var fapi:FlickrApi!
    var cache:NSCache!
    var task: NSURLSessionDownloadTask!
    var session: NSURLSession!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 200.0; // set to whatever your "average" cell height is

        
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FlickrCell") as! FlickrTableViewCell
        let cellInfo = flickrTableDataSource[indexPath.row]
        
        cell.cellInfo = cellInfo
    
        let date_taken = cellInfo.date_taken
        let media = cellInfo.media

            // check if the image is already present in the cache
        if let img = cache.objectForKey(date_taken!) {
            cell.mainImageView?.image = img as? UIImage
        }
            
            // set placeholder image , make network request then set image
        else {
            cell.mainImageView?.image = UIImage(named: "placeholder")
            
            fapi.downloadFlickrImage(media! , completion: {  (image, error) -> Void in
                
                print("media! = \(media!)")
                if error != nil {
                    print(error)
                } else {
                    let updateCell  = tableView.cellForRowAtIndexPath(indexPath) as? FlickrTableViewCell
                    updateCell?.mainImageView?.image = image
                    self.cache.setObject(image!, forKey: date_taken!)
                }
            })
            
        }

        
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}




