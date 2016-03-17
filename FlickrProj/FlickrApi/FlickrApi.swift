//
//  FlickrApi.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import Foundation
import UIKit


typealias flickrResult = (dic:NSDictionary?, error:NSError? ) -> Void

class FlickrApi {
    
    var session: NSURLSession!
    var task: NSURLSessionDownloadTask!
    
    
    init(){
        
        session = NSURLSession.sharedSession()
        task = NSURLSessionDownloadTask()
    }
    
    
    
    func getFlickrData(completion: flickrResult ) {

        // Json retured from this is sometimes valid and othertimes invalid
        let url = NSURL(string: "http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!
        
        print("url = \(url)")
        task = session.downloadTaskWithURL(url, completionHandler: { (location:NSURL?, response:NSURLResponse?, error:NSError?) -> Void in
            

            if let location = location {
                let data = NSData(contentsOfURL: location)
                
                
                do {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data!, options: [.AllowFragments]) as? NSDictionary
                    let items = dic!["items"] as? NSDictionary
                    print(items)
                    completion(dic: items , error: nil)
        
                    
                } catch  let error as NSError {
                    completion(dic: nil, error: error)
                    
                }
            }
            else {
                completion(dic: nil, error: nil)
            }
        })
        task.resume()
    }
    
    
}