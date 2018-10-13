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
    var datasourceArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiCall = ApiManager.shared.moviesFromApi()
        tableView.reloadData()
        let apiCall.then{
            movies -> Void in
            self.datasourceArray = movies
            self.tableView.reloadData()
            
            } .catch{ error
                Void -> in
                
        }
       tableView.reloadData()
            self.setUp()
        
          
        
       
    }

    func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Celda", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Celda")
    }
  
    

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda") as! Celda
        cell.titleLbl.text = datasourceArray[indexPath.row].title
        cell.dateLbl.text = datasourceArray[indexPath.row].release_date
        cell.overviewLbl.text = datasourceArray[indexPath.row].overview
        cell.popularityLbl.text = "\(datasourceArray[indexPath.row].popularity)"
        cell.votesLbl.text = "\(datasourceArray[indexPath.row].vote_average)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasourceArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

