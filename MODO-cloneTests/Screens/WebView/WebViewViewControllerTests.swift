//
//  WebViewViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class WebViewViewControllerTests: XCTestCase {
    var sut: WebViewViewController!
    var tabBarController: UITabBarController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WebviewStoryboard") as! WebViewViewController
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
        XCTAssertNotNil(sut.webView)
        XCTAssertNotNil(sut.backButton)
        XCTAssertNotNil(sut.loadingSpinner)
    }
    
    func testActionButtonTap() throws {
        sut.backButtonPressed()
        XCTAssertNotNil(sut.navigationController)
        XCTAssertTrue(sut.navigationController!.viewControllers.count == 1)
    }
    
    func testViewWillAppear() throws {
        sut.viewWillAppear(true)
        XCTAssertTrue(sut.tabBarController?.tabBar.isHidden == true)
    }
    
    func testViewWillDisappear() throws {
        sut.viewWillDisappear(true)
        XCTAssertTrue(sut.tabBarController?.tabBar.isHidden == false)
    }
    
    func testWebViewLoad() {
        let url = URL(string: "https://www.example.com/")!
        sut.urlToShow = "https://www.example.com/"
        sut.viewDidLoad()
        XCTAssertEqual(sut.webView.url, url)
        XCTAssertTrue(sut.webView.isInspectable)
    }
    
    func testLoadingSpinner() {
        sut.viewDidLoad()
        XCTAssertEqual(sut.loadingSpinner.contentMode, .scaleAspectFit)
        XCTAssertEqual(sut.loadingSpinner.loopMode, .playOnce)
    }
}
