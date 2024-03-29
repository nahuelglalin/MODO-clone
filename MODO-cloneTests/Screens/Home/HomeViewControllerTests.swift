//
//  HomeViewControllerTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 21/02/2024.
//

/*
import XCTest
@testable import MODO_clone

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var mockPresenter: MockHomePresenter!
    var mockFeedDataModel: [FeedDataModel]!
    var mockPromosDataModel: PromosDataModel!
    
    override func setUpWithError() throws {
        mockPresenter = MockHomePresenter()
        mockFeedDataModel = MockFeedDataModel.mockInstance
        mockPromosDataModel = MockPromosDataModel.mockInstance
        
        sut = HomeViewController()
        sut.presenter = mockPresenter
        sut.feedDataModel = mockFeedDataModel
        sut.promosDataModel = mockPromosDataModel
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockPresenter = nil
        mockFeedDataModel = nil
        mockPromosDataModel = nil
    }
    
    func testInitialization() throws {
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.feedDataModel)
        XCTAssertNotNil(sut.promosDataModel)
    }
    
    func testRenderAccountsCarousel() throws {
        // Simular la notificación y verificar que se llame al método correspondiente del presenter
        NotificationCenter.default.post(name: NSNotification.Name("UserDataModelUpdated"), object: nil)
        XCTAssertTrue(mockPresenter.getAccountsAmountCalled)
        XCTAssertTrue(mockPresenter.navigateToNotificationsCalled)
    }
    
    func testEyeIconTapped() throws {
        // Verificar que el método del presentador se llama cuando se toca el ícono del ojo
        sut.eyeIconTapped()
        XCTAssertTrue(mockPresenter.navigateToNotificationsCalled)
    }
    
    func testNavigateToPromosScreen() throws {
        // Verificar que el método del presentador se llama cuando se toca "Ver más promociones"
        sut.navigateToPromosScreen()
        XCTAssertTrue(mockPresenter.navigateToPromosScreenCalled)
    }
    
    // Puedes agregar más pruebas según sea necesario
    
}
*/
