//
//  Flickr.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import Foundation


struct Flickr {
    
    var author:String?
    var author_id:String?
    var date_taken:String?
    var desription:String?
    var link:String?
    var media:String?
    var published:String?
    var tags: String?
    var title:String?
    
}



//This is the json file i'll use to test

//    {
//    "author":
//    "nobody@flickr.com (Emile Kympers)",
//    "author_id":
//    "76618489@N03",
//    "date_taken":
//    "2015-11-04T13:50:14-08:00",
//    "description": " Extemely Hot Chillies , Only The Brave! ",
//    "link":
//    "https://www.flickr.com/photos/emilekympers/22180553493/",
//    "media":
//    {
//    "m":
//    "https://farm6.staticflickr.com/5659/22180553493_53acc2ac02_m.jpg"
//    },
//    "published":
//    "2015-11-05T12:22:12Z",
//    "tags":
//    "macro chili belgium belgique cayenne macrophotography wallonie gardenning wallonia pepperflower rebecq d7100 tamronsp90mmf28vcusd emilekympers",
//    "title":
//    "Red 



class FlickrFactory {
    
    var numberOfObjects:Int!
    init(numberOfFlickrObjects:Int = 10) {
        numberOfObjects = numberOfFlickrObjects
    }
    
    
    /**
     Creates a number of instances of flickr objects and returns an array
     the dataTaken varable is differnt for each object because this will be used as the key for 
     the cache , so to make the app more realistic , The  key is unique for each object thus
     the images will be downloaded from the servers for all objects due to the  uniqueness of 
     the key
     
     - returns: returns an Array of Flickr Objects.
     
     */
    
    func createFlickrInstaces() -> [Flickr] {
        var flickrObjects = [Flickr]()
        let author:String =     "nobody@flickr.com (Emile Kympers)"
        let author_id:String =     "76618489@N03"
        let date_taken:String = "2015-11-04T13:50:14-08:00"
        let desription:String = "Extemely Hot Chillies , Only The Brave!"
        let link:String = "https://www.flickr.com/photos/emilekympers/22180553493/"
        let media:String = "https://farm6.staticflickr.com/5659/22180553493_53acc2ac02_m.jpg"
        let published:String = "2015-11-05T12:22:12Z"
        let tags: String = "macro chili belgium belgique cayenne macrophotography wallonie gardenning wallonia pepperflower rebecq d7100 tamronsp90mmf28vcusd emilekympers"
        let title:String = "Red hot"
        
        
        for i in 0..<numberOfObjects {
            //                The cache takes the data_taken var  as a key and an image as a value so I append the counter i to the data_taken var 
            //                So that all the date_taken vars are different . This allows the cache key to different for each entry
            let flickrObject = Flickr(author: author, author_id: author_id, date_taken: date_taken + "\(i)", desription: desription, link: link, media: media, published: published, tags: tags, title: title)
            
            flickrObjects.append(flickrObject)
        }
        
        return flickrObjects
        
    }
    
}








