//
//  CardTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class CardTests: XCTestCase {
    var sut: Card!
    
    override func setUpWithError() throws {
        sut = Card()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.bankLogoImageView)
        XCTAssertNotNil(sut.lastDigitsLabel)
        XCTAssertNotNil(sut.typeLabel)
        XCTAssertNotNil(sut.expirationDateLabel)
        XCTAssertNotNil(sut.issuerTypeView)
        XCTAssertNotNil(sut.cardTypeBackgroundImageView)
        XCTAssertNotNil(sut.cardColor)
    }
    
    func testConfigureFunction() throws {
        sut.configure(bankName: "Banco MODO", bankLogoUrl: "https://example.com/img.png", lastDigits: "1234", expirationDate: "12/25", issuerLogo: "https://example.com/img.png", issuerName: "visa", type: "DEBIT", background: "https://example.com/img.png", cardColor: UIColor.red)
        
        sut.configure(bankName: "Galicia", bankLogoUrl: "https://example.com/img.png", lastDigits: "1234", expirationDate: "12/25", issuerLogo: "https://example.com/img.png", issuerName: "mastercard", type: "CREDIT", background: "https://example.com/img.png", cardColor: UIColor.red)
    }
    
    func testInitWithCoder() {
        let object = Card()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = Card(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
