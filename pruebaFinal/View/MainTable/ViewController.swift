//
//  ViewController.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/12/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit
import SDWebImage

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

   

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda") as! Celda
        
        cell.titleLbl.text = mainArray[indexPath.row].title
        cell.dateLbl.text = mainArray[indexPath.row].release_date
        cell.descriptionLbl.text = mainArray[indexPath.row].overview
        cell.popularityLbl.text = "Popularidad: \(mainArray[indexPath.row].popularity!)"
        cell.votesLbl.text = "Votos: \(mainArray[indexPath.row].vote_average!)/10"
        let urlIma = ("\(imageUrl)\(mainArray[indexPath.row].poster_path!)")
        cell.imageMovie.sd_setImage(with: URL(string: urlIma))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailedView", sender: mainArray[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedView" {
            if let detailVC = segue.destination as? DetailedView {
                if let movieAux = sender as? Movie {
                        detailVC.currentMovie = movieAux
                }
                
            }
        }
    }
}

