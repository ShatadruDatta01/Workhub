//
//  LaunchController.swift
//  Workhub
//
//  Created by Shatadru Datta on 11/21/17.
//  Copyright © 2017 Sociosquares. All rights reserved.
//

import UIKit

class LaunchController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginAPICall()
//        let jobPageVC = mainStoryboard.instantiateViewController(withIdentifier: "SearchJobController") as! SearchJobController
//        NavigationHelper.helper.contentNavController!.pushViewController(jobPageVC, animated: false)
        // Do any additional setup after loading the view.
    }
}


extension LaunchController {
    func loginAPICall() {
        let concurrentQueue = DispatchQueue(label:DeviceSettings.dispatchQueueName("getLogin"), attributes: .concurrent)
        API_MODELS_METHODS.login(queue: concurrentQueue, completion: {responseDict,isSuccess in
            if isSuccess {
                
            } else {
                
            }
        })
    }
}
