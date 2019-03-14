//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Elena Melnikova on 2019-03-14.
//

import Foundation



enum Method: String{
    case interestingPhotos = "flickr.interestingness.getList"
    
    
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL(method:Method, parameters: [String:String]?) -> URL{
        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        if let additionalParams = parameters{
            for(key,value) in additionalParams{
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
        //return URL(string: "")!
    }
    
    static var interestingPhotosURL: URL{
        return flickrURL(method: .interestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
}






