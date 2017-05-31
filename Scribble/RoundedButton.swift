//
//  RoundedButton.swift
//  Scribble
//
//  Created by Hung Nguyen on 5/31/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30 {
        
        didSet {
            setUpView()
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }
    
    func setUpView() {
        
        layer.cornerRadius = cornerRadius
        
    }
    
    

}
