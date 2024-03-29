//
//  LoginViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

// VC + Storyboard
final class LoginViewControllerTests: XCTestCase {
    
    var sut: LoginViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoginStoryboard") as! LoginViewController
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        _ = try XCTUnwrap(sut.image, "")
    }
    
}
