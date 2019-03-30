//
//  customView.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 30/03/19.
//  Copyright © 2019 Ayush Verma. All rights reserved.
//

import UIKit

@IBDesignable
class customView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    

}
