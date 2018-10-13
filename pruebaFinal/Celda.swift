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
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var votesLbl: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var popularityLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 6.0
        viewCell.layer.shadowOpacity = 0.7
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
