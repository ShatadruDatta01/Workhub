//
//  TabBarController.swift
//  GetMoreSports
//
//  Created by redapple043 on 12/04/17.
//  Copyright © 2017 redapple043. All rights reserved.
//

import UIKit

class TabBarController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.tabBarViewController = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}




