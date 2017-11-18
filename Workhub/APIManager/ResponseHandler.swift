//
//  ResponseHandler.swift
//  Urbaneapp
//
//  Created by RedApple0018 on 18/11/16.
//  Copyright © 2016 RedAppleTech. All rights reserved.
//

import Foundation

/// Contains the MessageHandlers
struct ResponseMessageHandler {
    static let SUCCESS = "success"
    static let FAILURE = "failure"
    static let NOCONNECTIVITY = "No Internet Connection"
}
/// Contains the MessageHandler Codes
struct ResponseCodeHandler {
    static let SUCCESS = "1"
    static let FAILURE = "0"
    
    static let SUCCESS_TRUE = "true"
    
    static let API_HEALTH = "good"
//    static let LOGIN_ANOTHER_DEVICE = "17"
//    static let DELETE_ACCOUNT_STATUS = "100"
//    static let ADD_STAFF_BLOCK = "97"
}
/// Contains the MessageHandlers for Facebook
struct ResponseFacebookHandler {
    static let DENY = "DENIED"
    static let SUCCESS = "SUCCESS"
    static let CANCELED = "CANCELED"
}

struct ResponseAPIsHandler {
    
}
