//
//  SlideMenuViewController.swift
//  Greenply
//
//  Created by Jitendra on 9/8/16.
//  Copyright © 2016 Indus Net. All rights reserved.
//

import UIKit
class SlideMenuViewController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeLeftViewWidth(width: IS_IPAD() ? 0.65*(self.view.frame.width) : 0.8*(self.view.frame.width))
        
       //   self.changeRightViewWidth(width: IS_IPAD() ? 0.65*(self.view.frame.width) : 0.8*(self.view.frame.width))
    }
}



