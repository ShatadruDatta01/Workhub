//
//  ProfileCell.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class ProfileCell: BaseTableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnCamera: UIButton!
    override var datasource: AnyObject?{
        didSet {
            if datasource != nil {
                self.imgProfile.layer.borderWidth = 2.0
                self.imgProfile.layer.borderColor = UIColorRGB(r: 226.0, g: 155.0, b: 48.0)?.cgColor
            }
        }
    }
}
