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
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

