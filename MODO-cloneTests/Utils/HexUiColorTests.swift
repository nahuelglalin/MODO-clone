//
//  HexUiColorTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class HexUiColorTests: XCTestCase {
    
    func testHexStringToUIColor() {
        let color = hexStringToUIColor(hex: "#00FF00")
        XCTAssertEqual(color, UIColor(red: 0, green: 1, blue: 0, alpha: 1))
    }
    
    func testInvalidHexStringToUIColor() {
        let color = hexStringToUIColor(hex: "invalidHexValue")
        XCTAssertEqual(color, UIColor.gray)
    }
}
