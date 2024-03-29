//
//  ProfileViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class ProfileViewControllerTests: XCTestCase {
    var sut: ProfileViewController!
    var mockUserDataModel = MockUserDataModel.mockInstance
    
    override func setUpWithError() throws {
        sut = ProfileViewController(userDataModel: mockUserDataModel)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadView() throws {
        XCTAssertNotNil(sut.userDataModel)
        XCTAssertNotNil(sut.userCardView)
    }

    func testOptionsTableViewConfiguration() throws {
        XCTAssertNotNil(sut.optionsTableView.dataSource)
        XCTAssertNotNil(sut.optionsTableView.delegate)
    }

    func testTableViewCellConfiguration() throws {
        let indexPath = IndexPath(row: 0, section: 0)
        _ = sut.tableView(sut.optionsTableView, cellForRowAt: indexPath) as! SettingsCell
    }

    func testDidSelectRow() throws {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(sut.optionsTableView, didSelectRowAt: indexPath)
    }
    
    func testInitWithCoder() throws {
        let coder = NSCoder()
        XCTAssertNoThrow(ProfileViewController(coder: coder))
    }
}
