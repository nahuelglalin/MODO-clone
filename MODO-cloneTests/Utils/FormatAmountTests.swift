//
//  FormatAmountTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class FormatAmountTests: XCTestCase {

    func testFormatAmountWithValidInput() {
          let result = formatAmount("123456.78")
          XCTAssertEqual(result, "123.456,78")
      }
      
      func testFormatAmountWithInvalidInput() {
          let result = formatAmount("abc")
          XCTAssertEqual(result, "abc")
      }
      
      func testFormatAmountWithEmptyInput() {
          let result = formatAmount("")
          XCTAssertEqual(result, "")
      }


}
