//
//  Structs.swift
//  Fetch-Example
//
//  Created by Steven Lee on 10/24/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import Foundation


struct ImageObject: Codable
{
    //String, URL, Bool and Date conform to Codable.
    var author: String
    var author_url: URL
    var filename: String
    var format : String
    var height : Int
    var id : Int
    var post_url : URL
    var width: Int
    
}
