//
//  MovieApiResponse.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/13/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieApiResponse: Mappable {
    
    var movies: [Movie]?
    
    required init?(map: Map) {
      
    }
    
    func mapping(map: Map) {
        movies <- map["results"]
    }
}

class Movie: Mappable {
    var title: String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
    var popularity: Double?
    var poster_path: String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        title <- map["title"]
        release_date <- map["release_date"]
        overview <- map["overview"]
        vote_average <- map["vote_average"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
    }
    
    
}
