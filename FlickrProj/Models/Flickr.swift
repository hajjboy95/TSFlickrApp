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
//    "description": " <p><a href=\"https://www.flickr.com/people/emilekympers/\">Emile Kympers<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/emilekympers/22180553493/\" title=\"Red hot\"><img src=\"https://farm6.staticflickr.com/5659/22180553493_53acc2ac02_m.jpg\" width=\"160\" height=\"240\" alt=\"Red hot\" /><\/a><\/p> ",
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
//    "Red hot"
//}
    
    class FlickrFactory {
        
        var numberOfObjects:Int!
        init(numberOfFlickrObjects:Int = 10) {
            numberOfObjects = numberOfFlickrObjects
        }

        func createFlickrInstaces() -> [Flickr] {
            var flickrObjects = [Flickr]()
            let author:String =     "nobody@flickr.com (Emile Kympers)"
            let author_id:String =     "76618489@N03"
            let date_taken:String = "2015-11-04T13:50:14-08:00"
            let desription:String = "Test description"
            let link:String = "https://www.flickr.com/photos/emilekympers/22180553493/"
            let media:String = "https://farm6.staticflickr.com/5659/22180553493_53acc2ac02_m.jpg"
            let published:String = "2015-11-05T12:22:12Z"
            let tags: String = "macro chili belgium belgique cayenne macrophotography wallonie gardenning wallonia pepperflower rebecq d7100 tamronsp90mmf28vcusd emilekympers"
            let title:String = "Red hot"
            
            let flickrObject = Flickr(author: author, author_id: author_id, date_taken: date_taken, desription: desription, link: link, media: media, published: published, tags: tags, title: title)
            
            for _ in 0..<numberOfObjects {
                flickrObjects.append(flickrObject)
            }
            
            return flickrObjects
            
        }
        
}


    
    




