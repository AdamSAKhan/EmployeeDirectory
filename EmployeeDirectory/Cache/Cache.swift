//
//  Cache.swift
//  EmployeeDirectory
//
//  Created by Adam Khan on 19/12/2022.
//

import Foundation
import SwiftUI

class PhotoModelCacheManager {
    static let instance = PhotoModelCacheManager()
    private init() {}
    
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 50
        cache.totalCostLimit = 1024*1024*200  // Roughly 200mb
        return cache
    }()
    
    func addImage(key:String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func getImage(key: String) -> UIImage? {
        photoCache.object(forKey: key as NSString)
    }

}
