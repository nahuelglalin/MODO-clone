//
//  WalletViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class WalletViewControllerTests: XCTestCase {
    var sut: WalletViewController!
    var mockUserDataModel = MockUserDataModel.mockInstance
    
    override func setUpWithError() throws {
        sut = WalletViewController(userDataModel: mockUserDataModel)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.customHeaderView)
    }
    
    func testInitialization() throws {
        XCTAssertEqual(sut.cardModels.count, mockUserDataModel.cards.count)
        XCTAssertEqual(sut.accountModels.count, mockUserDataModel.accounts.count)
    }
    
    func testButtonsConfiguration() throws {
        XCTAssertTrue(sut.cardsButton.isSelected)
        XCTAssertFalse(sut.accountsButton.isSelected)
        XCTAssertEqual(sut.cardsButton.configuration?.baseBackgroundColor, UIColor.darkBlueModo)
        XCTAssertEqual(sut.accountsButton.configuration?.baseBackgroundColor, UIColor.lightGrayModo)
    }
    
    func testButtonTapped() throws {
        sut.buttonTapped(sender: sut.accountsButton)
        XCTAssertFalse(sut.cardsButton.isSelected)
        XCTAssertTrue(sut.accountsButton.isSelected)
        XCTAssertEqual(sut.cardsButton.configuration?.baseBackgroundColor, UIColor.lightGrayModo)
        XCTAssertEqual(sut.accountsButton.configuration?.baseBackgroundColor, UIColor.darkBlueModo)
    }
}
