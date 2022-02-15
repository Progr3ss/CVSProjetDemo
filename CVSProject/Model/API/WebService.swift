//
//  WebService.swift
//  CVSDemo
//
//  Created by Martin Chibwe on 2/14/22.
//

import Foundation

class WebService {
    // API base link
    let BASE_URL = "https://api.flickr.com/services/feeds/photos_public.gne?"
    
    func getFlickrPictures(query: String, completion: @escaping ([FlickrItems]?) ->()) {
        // query - is search text from search field
        let url = URL(string: BASE_URL + "format=json&nojsoncallback=1&tags=\(query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")")!
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: url) { data,response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                print(data)
                let flickrPictures = try? JSONDecoder().decode(FlickrResponseItem.self, from: data)
                
                if let flickrPictures = flickrPictures {
                    completion(flickrPictures.items)
                }
            }
        }
        .resume()
    }
}
