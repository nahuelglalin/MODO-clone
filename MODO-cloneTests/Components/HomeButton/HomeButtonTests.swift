//
//  HomeButtonTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class HomeButtonTests: XCTestCase {
    var sut: HomeButton!
    
    override func setUpWithError() throws {
        sut = HomeButton()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.view)
        XCTAssertNotNil(sut.button)
    }
    
    func testSetupFunction() throws {
        sut.setup(text: "Pagar", backgroundColor: UIColor.red, image: UIImage(systemName: "star.fill")!, borderColor: UIColor.red, textColor: UIColor.red, spacing: 2.2)
    }
    
    func testInitWithCoder() {
        let object = HomeButton()
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            let coder = try NSKeyedUnarchiver.init(forReadingFrom: data)
            let sut = HomeButton(coder: coder)
            XCTAssertNotNil(sut)
        } catch {
            print("error: \(error)")
        }
    }
}
