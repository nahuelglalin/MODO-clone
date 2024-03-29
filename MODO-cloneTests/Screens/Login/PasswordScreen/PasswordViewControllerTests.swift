//
//  PasswordViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class PasswordViewControllerTests: XCTestCase {

    var sut: PasswordViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Password", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PasswordStoryboard") as! PasswordViewController
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        _ = try XCTUnwrap(sut.passwordLabel)
    }
    
}
