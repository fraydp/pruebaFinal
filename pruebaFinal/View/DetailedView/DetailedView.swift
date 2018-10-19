//
//  DetailedView.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/18/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit
import SDWebImage

class DetailedView: UIViewController {
    var currentMovie: Movie!
    
    
  
    @IBOutlet weak var titleDetailLbl: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var viewImageDetail: UIView!
    @IBOutlet weak var votesDetailLbl: UILabel!
    @IBOutlet weak var descriptionDetailLbl: UILabel!
    @IBOutlet weak var popularityDetailLbl: UILabel!
    @IBOutlet weak var dateDetailLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetail.layer.cornerRadius = 20
        
        viewImageDetail.layer.shadowColor = UIColor.black.cgColor
        viewImageDetail.layer.cornerRadius = 20
        viewImageDetail.layer.shadowRadius = 10
       
        viewImageDetail.layer.shadowOpacity = 10
        
       
        setDetails()
        
      
        
        
    }
    
    func setDetails() {
        
        popularityDetailLbl.text = "popularidad: \(currentMovie.popularity!)"
        votesDetailLbl.text = "votos: \(currentMovie.vote_average!)/10"
        descriptionDetailLbl.text = "\(currentMovie.overview!)"
        dateDetailLbl.text = "\(currentMovie.release_date!)"
        
        let urlIma2 = ("\(imageUrl)\(currentMovie.poster_path!)")

        imageDetail.sd_setImage(with: URL(string: urlIma2))
        titleDetailLbl.text = "\(currentMovie.title!)"
    }

  
    @IBAction func backTable(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    



    }






