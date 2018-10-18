//
//  ViewController.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/12/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var mainArray = [Movie]()
    
    override func viewDidLoad() {
        setUp()
        super.viewDidLoad()
       
    }
        
    

    func setUp(){
  
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
        
       
            cell.titleLbl.text = mainArray[indexPath.row].title
            cell.dateLbl.text = mainArray[indexPath.row].release_date
            cell.descriptionLbl.text = mainArray[indexPath.row].overview
            cell.popularityLbl.text = "\(mainArray[indexPath.row].popularity!)"
            cell.votesLbl.text = "\(mainArray[indexPath.row].vote_average!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

