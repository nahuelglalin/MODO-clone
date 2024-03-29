//
//  PromosViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class PromosViewControllerTests: XCTestCase {
    var sut: PromosViewController!
    var tabBarController: UITabBarController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Promos", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PromosStoryboard") as! PromosViewController
        sut = vc
        tabBarController = UITabBarController()
        sut.loadViewIfNeeded()
        tabBarController.viewControllers = [vc]
    }
    
    override func tearDownWithError() throws {
        sut = nil
        tabBarController = nil
    }
    
    func testloadViewController() throws {
        XCTAssertNotNil(sut)
    }
    
    func testWebViewLoad() {
        let url = URL(string: PROMOS_WEBVIEW)!
        sut.viewDidLoad()
        XCTAssertEqual(sut.webView.url, url)
    }
}
