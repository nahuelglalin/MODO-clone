//
//  FeedDetailTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class FeedDetailTests: XCTestCase {
    var sut: FeedDetail!
    
    override func setUpWithError() throws {
        sut = FeedDetail()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.headerCell)
        XCTAssertNotNil(sut.paymentMethodTitle)
        XCTAssertNotNil(sut.bankName)
        XCTAssertNotNil(sut.installments)
        
        XCTAssertNotNil(sut.date)
        XCTAssertNotNil(sut.idText)
        XCTAssertNotNil(sut.paymentID)
        XCTAssertNotNil(sut.referenceID)
        
        XCTAssertNotNil(sut.ticketButton)
        XCTAssertNotNil(sut.splitButton)
        
        XCTAssertNotNil(sut.helpText)
        XCTAssertNotNil(sut.cancelText)
    }
    
    func testInitWithCoder() {
        let object = FeedDetail()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = FeedDetail(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
