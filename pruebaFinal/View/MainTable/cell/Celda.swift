//
//  Celda.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/12/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class Celda: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var votesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 6.0
        viewCell.layer.shadowOpacity = 0.7
        viewCell.layer.shadowRadius = 5
        viewCell.layer.shadowColor = UIColor.black.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
