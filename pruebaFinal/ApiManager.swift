//
//  ApiManager.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/13/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiManager{
    static let shared = ApiManager()
    private var manager: SessionManager
    
    private init(){
        self.manager = Alamofire.SessionManager.default
    }
    
    func moviesFromApi(completion:@escaping (Array<Movie>) -> Void, failure:@escaping (Int, String) -> Void) -> Void{
        self.manager.request(API_URL).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success:
                guard let responseJSON = response.result.value as? Dictionary <String , Any> else{
                    failure (0, "Error reading response")
                    return
                  
                }
                guard let responseJson2 = responseJSON["results"] as? [Dictionary <String, Any>] else {
                    failure(0, "Error JSON2")
                    return
                }
                guard let movies: [Movie] = Mapper<Movie>().mapArray(JSONArray: responseJson2) else {
                    failure(0, "Error mapping response")
                    return
                }
                print(movies[0].title)
                completion(movies)
                
            case .failure(let error):
                failure(0, "Error \(error)")
                
            }
            
        }
    }
    
}
//--------------------------------------------------------Con array----------------------------

//func moviesFromApi(completion:@escaping (Array<Movie>) -> Void, failure:@escaping (Int, String) -> Void) -> Void{
//    self.manager.request(API_URL).validate(statusCode: 200..<300).responseJSON { response in
//        switch response.result {
//        case .success:
//            guard let responseJSON = response.result.value as? Array<[String: Any]> else{
//                failure (0, "Error reading response")
//                return
//
//            }
//            guard let movies: [Movie] = Mapper<Movie>().mapArray(JSONArray: responseJSON) else {
//                failure(0, "Error mapping response")
//                return
//            }
//            completion(movies)
//        case .failure(let error):
//            failure(0, "Error \(error)")
//
//        }
//
//    }
//}


//-----------------------como en fcf----------------------------
//func moviesFromApi(successBlock: @escaping (_ response: String) -> (), errorBlock: @escaping (_ error: AnyObject?) -> ()){
//    Alamofire.request(API_URL).validate().responseString
//        { (response) in
//            switch(response.result) {
//            case .success(let responseString):
//
//                successBlock(responseString)
//                break
//            case .failure(let error):
//                errorBlock(error as AnyObject)
//                break
//            }
//
//
//    }
//
//}
