//
//  HeaderViewController.swift
//  GetMoreSports
//
//  Created by redapple043 on 12/04/17.
//  Copyright © 2017 redapple043. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    var isBack = false
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var labelTitleText: UILabel!
    @IBOutlet weak var labelNotify: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.headerViewController = self
        self.labelNotify.layer.cornerRadius = DeviceType.IS_IPAD ? 10.0 : 8.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func isShowNavBar(isShow: Bool) {
        if isShow == true {
            NavigationHelper.helper.mainContainerViewController!.headerHeightConstraint.constant = DeviceType.IS_IPAD ? 74.0 : 64.0
                NavigationHelper.helper.mainContainerViewController!.view.layoutIfNeeded()
        } else {
           
                NavigationHelper.helper.mainContainerViewController!.headerHeightConstraint.constant = 0
                NavigationHelper.helper.mainContainerViewController!.view.layoutIfNeeded()
        }
    }

    //.......
    @IBAction func actionLeftButton(_ sender: UIButton) {
        if isBack == true {
            NavigationHelper.helper.openSidePanel(open: false)
            NavigationHelper.helper.contentNavController?.popViewController(animated: true)
        } else {
            NavigationHelper.helper.openSidePanel(open: true)
        }
        
    }
    
}





