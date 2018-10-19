//
//  File.swift
//  pruebaFinal
//
//  Created by Fray Pineda on 10/19/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit
    private var roundedKey = 0
private var shadowKey = false

extension UIImageView {

    @IBInspectable var rounded: Int{
        get{ return roundedKey }
        set{
            roundedKey = newValue
            if roundedKey > 0{
                self.layer.cornerRadius = CGFloat(roundedKey)
                self.clipsToBounds = true
            }else{
                self.clipsToBounds = false
            }
        }
    }
    
    @IBInspectable var shadow: Bool{
        get{ return shadowKey }
        set{
            shadowKey = newValue
            
            if shadowKey{
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 20
                self.layer.shadowOffset = CGSize(width: -2, height: 2)
                self.layer.shadowRadius = 1
            }else{
                self.layer.masksToBounds = true
            }
        }
    }
}
