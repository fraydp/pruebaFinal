//
//  Loading.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/15/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class Loading: UIViewController {
  
    
   var datasourceArray = [Movie]()
    var dataLoader = loadingPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLoader.shared.moviesFromApi(completion: { (receive) in
            self.datasourceArray = receive
            self.performSegue(withIdentifier: "toTable", sender: self.datasourceArray)
           
          
            
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
