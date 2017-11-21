//
//  LoginController.swift
//  Workhub
//
//  Created by Administrator on 20/11/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewEmail.layer.borderWidth = 1.0
        self.viewEmail.layer.borderColor = UIColorRGB(r: 200.0, g: 200.0, b: 200.0)?.cgColor
        
        self.viewPassword.layer.borderWidth = 1.0
        self.viewPassword.layer.borderColor = UIColorRGB(r: 200.0, g: 200.0, b: 200.0)?.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NavigationHelper.helper.headerViewController?.isShowNavBar(isShow: false)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /// Facebook SignIn
    ///
    /// - Parameter sender: Button
    @IBAction func btnFacebook(_ sender: UIButton) {
        
    }

    
    /// Google SignIn
    ///
    /// - Parameter sender: Button
    @IBAction func btnGoogle(_ sender: UIButton) {
    }
    
    
    /// Manual SignIn
    ///
    /// - Parameter sender: Button
    @IBAction func btnSignIn(_ sender: UIButton) {
    }
    
    
    /// Forgot Password
    ///
    /// - Parameter sender: Button
    @IBAction func btnForgotPassword(_ sender: UIButton) {
        let forgotPasswordPageVC = mainStoryboard.instantiateViewController(withIdentifier: "ForgotPasswordController") as! ForgotPasswordController
        NavigationHelper.helper.contentNavController!.pushViewController(forgotPasswordPageVC, animated: true)
    }
}
