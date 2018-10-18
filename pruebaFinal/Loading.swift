//
//  Loading.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/15/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class Loading: UIViewController {
    var completed = false
   var datasourceArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.shared.moviesFromApi(completion: { (receive) in
            self.datasourceArray = receive
            print(self.datasourceArray[0].poster_path!)
            self.performSegue(withIdentifier: "toTable", sender: self.datasourceArray)
           
            self.completed = true
            
        }, failure:{ (numero, error) in
            print("error")
        }
        )
        
    }

    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTable"{
            if let mainVC = segue.destination as? ViewController {
                if let datasourceArray = sender as? [Movie]{
                    mainVC.mainArray = datasourceArray
                }
            }
        }
    }
}
