//
//  ViewController.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/12/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var completed = false
    
    
    @IBOutlet weak var tableView: UITableView!
    var datasourceArray = [Movie]()
    
    override func viewDidLoad() {
        setUp()
        super.viewDidLoad()
        ApiManager.shared.moviesFromApi(completion: { (datasourceArray) in
            print(datasourceArray[2].title)
        }, failure:{ (numero, error) in
            print("error")
        }
        )
    }
        
    

    func setUp(){
   //     print(datasourceArray[0].title!)
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Celda", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Celda")
    }
  
  
//    ApiManager.shared.moviesFromApi(successBlock: { (response)  in
//    response
//    }, errorBlock:{ (error) in
//    print("error")
//
//
//    }
//    )
  
   

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda") as! Celda
//        cell.titleLbl.text = datasourceArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

