//
//  ErrorViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class ErrorViewControllerTests: XCTestCase {
    var sut: ErrorViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Error", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ErrorStoryboard") as! ErrorViewController
        sut = vc
        _ = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        XCTAssertNotNil(sut.actionBtn)
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertNotNil(sut.titleLabel)
    }
    
    func testActionButtonTap() throws {
        sut.actionButton(sut.actionBtn)
        XCTAssertNotNil(sut.navigationController)
        XCTAssertTrue(sut.navigationController!.viewControllers.count == 1)
    }
}
