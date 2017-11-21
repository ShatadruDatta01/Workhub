//
//  RegisterController.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class RegisterController: BaseViewController {

    @IBOutlet weak var tblRegister: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavigationHelper.helper.headerViewController?.isBack = false
        NavigationHelper.helper.headerViewController?.isShowNavBar(isShow: true)
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension RegisterController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellRegister = tableView.dequeueReusableCell(withIdentifier: "RegisterCell", for: indexPath) as! RegisterCell
            cellRegister.datasource = "" as AnyObject
            return cellRegister
        default:
            switch indexPath.row {
            case 0:
                let cellName = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
                cellName.datasource = "" as AnyObject
                cellName.imgLogo.image = UIImage(named: "UserIcon")
                cellName.txtField.placeholder = "Full Name"
                return cellName
            case 1:
                let cellEmail = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
                cellEmail.datasource = "" as AnyObject
                cellEmail.imgLogo.image = UIImage(named: "Mail")
                cellEmail.txtField.placeholder = "Email"
                return cellEmail
            case 2:
                let cellMob = tableView.dequeueReusableCell(withIdentifier: "MobCell", for: indexPath) as! MobCell
                cellMob.datasource = "" as AnyObject
                cellMob.imgLogo.image = UIImage(named: "Call")
                cellMob.txtMobNo.placeholder = "Mobile No"
                cellMob.txtExt.placeholder = "Ext"
                return cellMob
            case 3:
                let cellPassword = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
                cellPassword.datasource = "" as AnyObject
                cellPassword.imgLogo.image = UIImage(named: "PasswordIcon")
                cellPassword.txtField.placeholder = "Create Password"
                return cellPassword
            default:
                let cellButton = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
                cellButton.datasource = "" as AnyObject
                return cellButton
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180.0
        default:
            switch indexPath.row {
            case 0...3:
                return 45.0
            default:
                return 99.0
            }
        }
    }
}
