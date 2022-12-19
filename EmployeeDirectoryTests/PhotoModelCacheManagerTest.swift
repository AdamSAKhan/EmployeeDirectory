//
//  PhotoModelCacheManagerTest.swift
//  EmployeeDirectoryTests
//
//  Created by Adam Khan on 19/12/2022.
//

import XCTest
@testable import EmployeeDirectory

final class PhotoModelCacheManagerTest: XCTestCase {

    private let instance = PhotoModelCacheManager.instance
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    
    }
    
    func testGetPhoto() {
        let image = UIImage(systemName: "face.smiling")
        instance.addImage(key: "SomeKey", value: image ?? UIImage())
        XCTAssertEqual(image, instance.getImage(key: "SomeKey"))
    }
    
    func testAddPhoto() {
        instance.photoCache.removeAllObjects()
        XCTAssertNil(instance.photoCache.object(forKey: "SomeKey"))
        let image = UIImage(systemName: "face.smiling")
        
        instance.addImage(key: "SomeKey", value: image ?? UIImage())
        XCTAssertNotNil(instance.getImage(key: "SomeKey"))
    }
}
