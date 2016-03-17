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
    override func viewDidLoad() {
        super.viewDidLoad()

        

        let fapi = FlickrApi()
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



//if let img = cache.objectForKey(date_taken!) {
//    cell.imageView?.image = img as! UIImage
//}
//    //        set placeholder image , make netwrok request
//else {
//
//}

