//
//  DniViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class DniViewControllerTests: XCTestCase {
    
    var sut: DniViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Dni", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DniStoryboard") as! DniViewController
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        _ = try XCTUnwrap(sut.dniInput)
    }
    
}
