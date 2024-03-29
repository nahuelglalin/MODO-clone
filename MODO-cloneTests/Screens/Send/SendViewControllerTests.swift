//
//  SendViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class SendViewControllerTests: XCTestCase {
    var sut: SendViewController!
    var tabBarController: UITabBarController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Send", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SendStoryboard") as! SendViewController
        sut = vc
        tabBarController = UITabBarController()
        let navigationController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
        tabBarController.viewControllers = [navigationController]
    }
    
    override func tearDownWithError() throws {
        sut = nil
        tabBarController = nil
    }
    
    func testloadViewController() throws {
        XCTAssertNotNil(sut)
    }
    
    func testViewWillAppear() throws {
        sut.viewWillAppear(true)
        XCTAssertTrue(sut.tabBarController?.tabBar.isHidden == true)
    }
    
    func testViewWillDisappear() throws {
        sut.viewWillDisappear(true)
        XCTAssertTrue(sut.tabBarController?.tabBar.isHidden == false)
    }
}
