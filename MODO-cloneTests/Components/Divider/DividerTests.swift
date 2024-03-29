//
//  DividerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

// VC + Xib
final class DividerTests: XCTestCase {
    
    var sut: Divider!
    
    override func setUpWithError() throws {
        sut = Divider()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.separator)
    }
    
    func testInitWithCoder() {
        let object = Divider()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = Divider(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
