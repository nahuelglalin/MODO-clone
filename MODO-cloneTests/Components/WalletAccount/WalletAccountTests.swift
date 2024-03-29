//
//  WalletAccountTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

let ACCOUNT_MOCK: AccountModel = AccountModel(bankLogoUrl: "https://example.com/img.png", bankName: "Banco MODO", isFavorite: true)

final class WalletAccountTests: XCTestCase {

    var sut: WalletAccount!
    
    override func setUpWithError() throws {
        sut = WalletAccount()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.icon)
        XCTAssertNotNil(sut.label)
        XCTAssertNotNil(sut.favoriteImg)
        XCTAssertNotNil(sut.chevronIcon)
    }
    
    func testConfigureFunction() throws {
        sut.configure(with: ACCOUNT_MOCK)
    }
    
    func testInitWithCoder() {
        let object = WalletAccount()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = WalletAccount(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
