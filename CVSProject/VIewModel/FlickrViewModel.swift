//
//  FlickrViewModel.swift
//  CVSDemo
//
//  Created by Martin Chibwe on 2/14/22.
//

import Foundation
struct FlickrListItemsModel {
    let flickrItems: [FlickrItems]
}

struct FlickrViewModel {
    private let flickrItem: FlickrItems
}

extension FlickrListItemsModel {
    var numberOfSection: Int {
        return 1
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.flickrItems.count
    }
    
    func flickrItemsAtIndex(_ index: Int) -> FlickrViewModel {
        let flickrItem = self.flickrItems[index]
        return FlickrViewModel(flickrItem)
    }
}

extension FlickrViewModel {
    init(_ flickrItem: FlickrItems) {
        self.flickrItem = flickrItem
    }
}
extension FlickrViewModel {
    
    var photoTitle: String {
        return self.flickrItem.photoTitle
    }
    
    var description: String {
        return self.flickrItem.description
    }
    
    var media: String {
        return self.flickrItem.media.mediaString
    }
    var published: String {
        return self.flickrItem.published
    }
    var author: String {
        return self.flickrItem.author
    }
    var width: String {
        var widthString = ""
        if let range = description.range(of: "width=") {
            widthString = String(description[range.upperBound...])
            
        }
        var width = ""

        if let heightString = widthString.range(of: "height=") {
            let firstPart = widthString[widthString.startIndex..<heightString.lowerBound]
            width = String(firstPart)
        }
        return width
    }
    
    var height: String {
        var heightString = ""
        if let range = description.range(of: "height=") {
            heightString = String(description[range.upperBound...])
            
        }
        var height = ""
        if let widthString = heightString.range(of: "alt=") {
            let firstPart = heightString[heightString.startIndex..<widthString.lowerBound]
            height = String(firstPart)
        }
        return height
    }
}
