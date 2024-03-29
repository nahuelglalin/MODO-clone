//
//  SmallButtonTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class SmallButtonTests: XCTestCase {
    var sut: SmallButton!
    
    override func setUpWithError() throws {
        sut = SmallButton()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.button)
    }
    
    func testSetupFunction() throws {
        sut.setup(text: "SmallBtn", icon: UIImage(systemName: "star.fill")!)
    }
    
    func testInitWithCoder() {
        let object = SmallButton()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = SmallButton(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
