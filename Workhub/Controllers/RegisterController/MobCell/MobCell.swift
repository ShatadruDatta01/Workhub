//
//  MobCell.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class MobCell: BaseTableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtExt: UITextField!
    @IBOutlet weak var txtMobNo: UITextField!
    override var datasource: AnyObject?{
        didSet {
            if datasource != nil {
                
            }
        }
    }

}
