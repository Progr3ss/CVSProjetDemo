//
//  FlickrItems.swift
//  CVSDemo
//
//  Created by Martin Chibwe on 2/14/22.
//

import Foundation
struct FlickrResponseItem: Decodable {
    var items: [FlickrItems]
}

struct FlickrItems: Decodable {
    let photoTitle: String
    let media: Media
    let description: String
    let published: String
    let author: String
    private enum CodingKeys: String, CodingKey{
        case photoTitle = "title"
        case media = "media"
        case description
        case published
        case author
    }
}

struct Media: Codable {
    let mediaString: String
    
    private enum CodingKeys: String, CodingKey {
        case mediaString = "m"
    }
}
