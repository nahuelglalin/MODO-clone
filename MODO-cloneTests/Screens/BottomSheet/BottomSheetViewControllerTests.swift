//
//  BottomSheetViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class BottomSheetViewControllerTests: XCTestCase {
    var sut: BottomSheetViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "BottomSheetStoryboard") as! BottomSheetViewController
        sut = vc
        _ = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        XCTAssertNotNil(sut.bottomSheetContainer)
        XCTAssertNotNil(sut.dragIndicator)
    }
}
