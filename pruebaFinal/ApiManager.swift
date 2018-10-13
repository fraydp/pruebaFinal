//
//  ApiManager.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/13/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager{
    static let shared = ApiManager()
    
    private init(){
        
    }
    
    func moviesFromApi(Completed: @escaping DownloadComplete){
        Alamofire.request(API_URL).responseString { (response) in
            switch(response.result) {
            case .success(let responseString):
                print(responseString)
                let movieResponse = MovieApiResponse(JSONString: "\(responseString)")
            case .failure(let error):
                print(error)
            
            }
            Completed()
        }
        
    }
}
