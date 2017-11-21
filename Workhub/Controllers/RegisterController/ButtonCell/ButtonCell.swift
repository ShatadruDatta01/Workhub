//
//  ButtonCell.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class ButtonCell: BaseTableViewCell {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnTerms: UIButton!
    override var datasource: AnyObject?{
        didSet {
            if datasource != nil {
                
            }
        }
    }

}
