//
//  RegisterCell.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class RegisterCell: BaseTableViewCell {

    @IBOutlet weak var btnRegisterFacebook: UIButton!
    @IBOutlet weak var btnRegisterGoogle: UIButton!
    override var datasource: AnyObject?{
        didSet {
            if datasource != nil {
                
            }
        }
    }

}
