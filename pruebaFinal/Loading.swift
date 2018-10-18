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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
