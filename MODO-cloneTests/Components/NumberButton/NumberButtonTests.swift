//
//  NumberButtonTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

class MockNumberButtonDelegate: NumberButtonDelegate {
    var numberButtonPressedCalled = false
    
    func numberButtonPressed(_ sender: NumberButton) {
        numberButtonPressedCalled = true
    }
}

final class NumberButtonTests: XCTestCase {
    var sut: NumberButton!
    
    override func setUpWithError() throws {
        sut = NumberButton()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.number)
        XCTAssertNotNil(sut.letters)
        XCTAssertNotNil(sut.icon)
    }
    
    func testSetupFunctions() throws {
        sut.setup(number: "123", letters: "ASD")
        sut.setup(icon: UIImage(systemName: "star.fill")!)
    }
    
    func testButtonPressed() {
        let mockDelegate = MockNumberButtonDelegate()
        sut.delegate = mockDelegate
        sut.buttonPressed(UIButton())
        XCTAssertTrue(mockDelegate.numberButtonPressedCalled, "numberButtonPressed should be called")
    }
    
    func testInitWithCoder() {
        let object = NumberButton()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = NumberButton(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
