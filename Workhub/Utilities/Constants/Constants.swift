//
//  Constants.swift
//  GetMoreSports
//
//  Created by redapple043 on 12/04/17.
//  Copyright © 2017 redapple043. All rights reserved.
//

import Foundation
import UIKit

let SYSTEM_VERSION = UIDevice.current.systemVersion

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let MAIN_WINDOW = UIApplication.shared.windows.first

func IS_OF_4_INCH() -> Bool {
    switch UIDevice.current.modelName {
    case .iPhone5, .iPhone5S, .iPhone5C, .iPhoneSE:
        return true
    default:
        return false
    }
}

/// MARK:- End Points
let KEY = "$P$B6tKX7/rhqvmC54huOMYlwgqZ0oFXA1"
let REGISTRATION = "registration"
let FORGOT_PWD = "forgotpassword"
let LOGIN = "login"
let POST_COMMENT = "postcomment"
let SKIP = "Skip"
let CONTENT = "getcontent"
let CATEGORIES = "getcategories"
let MENUS = "getmenus"
let POSTS = "getposts"
let TERMS_AND_COND = 71821
let ABOUT_US = 804
let FACEBOOK = "facebook"
let GOOGLE = "google"
let TWITTER = "twitter"

//MARK:- BASEURL
let BASE_URL = "http://www.gms.redappletech.info/page-api/"


// MARK: Storyboard
let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)


// MARK:- Font
let FONT_NAME = "Roboto-Regular"
let kTableViewBackgroundImage = "BackgroundImage"

func IS_IPAD() -> Bool {
    
    switch UIDevice.current.userInterfaceIdiom {
    case .phone: // It's an iPhone
        return false
    case .pad: // It's an iPad
        return true
    case .unspecified: // undefined
        return false
    default:
        return false
    }
}

func SET_OBJ_FOR_KEY(obj: AnyObject, key: String) {
    UserDefaults.standard.set(obj, forKey: key)
}

func OBJ_FOR_KEY(key: String) -> AnyObject? {
    if UserDefaults.standard.object(forKey: key) != nil {
        return UserDefaults.standard.object(forKey: key)! as AnyObject?
    }
    return nil
}



func SET_INTEGER_FOR_KEY(integer: Int, key: String) {
    UserDefaults.standard.set(integer, forKey: key)
}

func INTEGER_FOR_KEY(key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}

func SET_FLOAT_FOR_KEY(float: Float, key: String) {
    UserDefaults.standard.set(float, forKey: key)
}

func FLOAT_FOR_KEY(key: String) -> Float? {
    return UserDefaults.standard.float(forKey: key)
}

func SET_BOOL_FOR_KEY(bool: Bool, key: String) {
    UserDefaults.standard.set(bool, forKey: key)
}

func BOOL_FOR_KEY(key: String) -> Bool? {
    return UserDefaults.standard.bool(forKey: key)
}

func REMOVE_OBJ_FOR_KEY(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
}

func UIColorRGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor? {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}
func UIBorderColor() -> UIColor {
    return UIColor(red: 212.0 / 255.0, green: 212.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
}

func UIColorRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor? {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func UIColorTabBarUnselected() -> UIColor? {
    return UIColor(red: 128.0 / 255.0, green: 127.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
}

func FIRST_WINDOW() -> AnyObject? {
    return UIApplication.shared.windows.first!
}

@available(iOS 10.0, *)
func APP_DELEGATE() -> AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
}

func SWIFT_CLASS_STRING(className: String) -> String? {
    return "\(Bundle.main.infoDictionary!["CFBundleName"] as! String).\(className)";
}

func PRIMARY_FONT(size: CGFloat) -> UIFont? {
    return UIFont(name: FONT_NAME, size: size)
}

//func SECONDARY_FONT(size: CGFloat) -> UIFont? {
// return UIFont(name: "Roboto-Regular", size: size)!
//}

/*
 if #available(iOS 9.0, *)
 {
 //System version is more than 9.0
 }
 else
 {
 
 }
 */
