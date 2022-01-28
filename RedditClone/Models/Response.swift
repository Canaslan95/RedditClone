//
//  Response.swift
//  RedditClone
//
//  Created by Oğulcan Aslan on 27.01.2022.
//

import Foundation

struct Response: Codable {
    
    var kind: String?
    var data: Data?
    
}

struct Data: Codable {
    
    var children: [Children]
    
}

struct Children: Codable {
    
    var data: ChildData?
    
}

struct ChildData: Codable {
    
    var title: String?
    var thumbnailHeight: Int?
    var thumbnailWidth: Int?
    var thumbnail: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
        case thumbnail
        case name
    }
    
}


