//
//  LoadingViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

import XCTest
@testable import MODO_clone

final class LoadingViewControllerTests: XCTestCase {
    var sut: LoadingViewController!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Loading", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoadingStoryboard") as! LoadingViewController
        sut = vc
        navigationController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testloadViewController() throws {
        XCTAssertNotNil(sut.lottieView)
    }
    
    func testViewWillDisappear() throws {
        sut.viewWillDisappear(true)
        XCTAssertTrue(sut.navigationController?.isNavigationBarHidden == true)
    }
}
