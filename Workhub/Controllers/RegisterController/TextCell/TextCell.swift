//
//  TextCell.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class TextCell: BaseTableViewCell {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtField: UITextField!
    override var datasource: AnyObject?{
        didSet {
            if datasource != nil {

            }
        }
    }

}
