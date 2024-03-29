//
//  PhoneScreenViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class PhoneScreenViewControllerTests: XCTestCase {

    var sut: PhoneViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Phone", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PhoneStoryboard") as! PhoneViewController
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        _ = try XCTUnwrap(sut.phoneInput)
    }
    

}
