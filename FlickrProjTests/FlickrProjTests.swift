//
//  FlickrProjTests.swift
//  FlickrProjTests
//
//  Created by Ismail El-habbash on 3/17/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import XCTest
@testable import FlickrProj

class FlickrProjTests: XCTestCase {
    
    var flickrDataArray:[Flickr]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        flickrDataArray = FlickrFactory(numberOfFlickrObjects: 10).createFlickrInstaces()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testFlickrApi() {
        
        let flickrApi = FlickrApi()
        let flickrData = flickrDataArray.first!
        
        let readyExpectation = expectationWithDescription("asyncFlickrCall")
        
        flickrApi.downloadFlickrImage(flickrData.media! ) { (image, error) -> Void in
            
            XCTAssertNil(error , "function should download  ")
            XCTAssert(image! is UIImage )
            
            readyExpectation.fulfill()
        }
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssertNil(error, "ERROR")
        }
    }
    
    func testFlickrFactory() {
        
        XCTAssert(flickrDataArray.count == 10)
        let flickrDataFirst = flickrDataArray.first!
        let flickrDataLast = flickrDataArray.last!
        
        let author = flickrDataFirst.author
        let dateTakenForFirst = flickrDataFirst.date_taken
        let dateTakenForLast  = flickrDataLast.date_taken
        let media = flickrDataFirst.media
        
        
        
        XCTAssert(author == "nobody@flickr.com (Emile Kympers)")
        XCTAssert(dateTakenForFirst == "2015-11-04T13:50:14-08:000")
        XCTAssert(dateTakenForLast  == "2015-11-04T13:50:14-08:009")
        
        XCTAssert(media == "https://farm6.staticflickr.com/5659/22180553493_53acc2ac02_m.jpg")
        
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
