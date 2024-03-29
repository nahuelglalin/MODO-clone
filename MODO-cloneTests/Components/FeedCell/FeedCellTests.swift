//
//  FeedCellTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class FeedCellTests: XCTestCase {
    var sut: FeedCell!
    
    override func setUpWithError() throws {
        sut = FeedCell()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.image)
        XCTAssertNotNil(sut.title)
        XCTAssertNotNil(sut.desc)
        XCTAssertNotNil(sut.amount)
    }
    
    func testSetupFunction() throws {
        sut.setup(imageUrl: "https://www.example.com/img.png", title: "title", desc: "desc", amount: "-1234")
        sut.setup(imageUrl: "https://www.example.com/img.png", title: "title", desc: "desc", amount: "+1234")
    }
    
    func testInitWithCoder() {
        let object = FeedCell()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = FeedCell(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
