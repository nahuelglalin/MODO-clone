//
//  IconTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class IconTests: XCTestCase {
    var sut: Icon!
    
    override func setUpWithError() throws {
        sut = Icon()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.icon)
    }
    
    func testSetupFunction() throws {
        sut.setup(icon: UIImage(systemName: "star.fill")!)
    }
    
    func testInitWithCoder() {
        let object = Icon()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = Icon(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }

}
