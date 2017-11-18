//
//  UIImage + AlamofireImage.swift
//  AlomofireImage
//
//  Created by Chinmay Das on 31/08/16.
//  Copyright © 2016 Indus Net Technologies. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
  
  static var imageCache: AutoPurgingImageCache?
  static var downloader: ImageDownloader?
  
  static func configureCache(withMemoryCapacity memoryCapacity: UInt64?, andPreferredMemoryAfterPurge preferredMemory:UInt64?) {
    imageCache = AutoPurgingImageCache(memoryCapacity: memoryCapacity!, preferredMemoryUsageAfterPurge: preferredMemory!)
    downloader = ImageDownloader(configuration: ImageDownloader.defaultURLSessionConfiguration(), downloadPrioritization: .fifo, maximumActiveDownloads: 10, imageCache: imageCache)
  }
  
  func setImage(withURL url: NSURL, placeHolderImageNamed placeholder:String?, andImageTransition imageTransition:ImageTransition) {
    
    var placeholderImage: UIImage? {
      if let placeholderImageName = placeholder {
        return UIImage(named: placeholderImageName)!
      }
      return nil
    }
    
   // self.af_imageDownloader = UIImageView.downloader!
    self.af_setImage(withURL: url as URL, placeholderImage: nil, filter: nil, progress: nil, imageTransition: imageTransition, runImageTransitionIfCached: true) { (response) in
        print(response)
    }
  }
  
  func setImage(withURL url: NSURL, placeHolderImageNamed placeholder:String?) {
    self.setImage(withURL: url, placeHolderImageNamed: placeholder, andImageTransition: .noTransition)
  }
  
}
