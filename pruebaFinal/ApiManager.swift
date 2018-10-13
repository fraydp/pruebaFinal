//
//  ApiManager.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/13/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class ApiManager{
    static let shared = ApiManager()
    
    private init(){
        
    }
    
    func moviesFromApi() -> Promise<[Movie]> {
        return Promise<[Movie]>{
            fullfil , reject -> Void in
            return  Alamofire.request(API_URL).responseString {
                (response) in
                
                switch(response.result) {
                case .success(let responseString):
                    print(responseString)
                    let movieResponse = MovieApiResponse(JSONString: "\(responseString)")
                    fullfil(movieResponse.movies!)
                case .failure(let error):
                    print(error)
                    reject(error)
                    
                }
                
            }
        }
       
        
    }
}
