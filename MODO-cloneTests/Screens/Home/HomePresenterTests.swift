//
//  HomePresenterTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 11/02/2024.
//

import XCTest
@testable import MODO_clone

final class HomePresenterTests: XCTestCase {
    var sut:  HomePresenter!
    var mockRouter: MockHomeRouter!
    var mockApiClient: MockHomeApiClient!
    var mockView: MockViewController!
    
    override func setUpWithError() throws {
        mockRouter = MockHomeRouter()
        mockApiClient = MockHomeApiClient()
        mockView = MockViewController()
        sut = HomePresenter(router: mockRouter, userDataModel: MockUserDataModel.mockInstance)
        sut.homeApiClient = mockApiClient
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockRouter = nil
        mockApiClient = nil
        mockView = nil
    }
    
    func testNavigateToPromosScreen() {
        sut.navigateToPromosScreen(fromView: mockView)
        XCTAssertTrue(mockRouter.navigateToPromosScreenCalled)
        XCTAssertEqual(mockRouter.fromView, mockView)
    }
    
    func testNavigateToWebView() {
        let testURL = "https://www.example.com"
        sut.navigateToWebView(fromView: mockView, withUrl: testURL)
        XCTAssertTrue(mockRouter.navigateToWebViewCalled)
        XCTAssertEqual(mockRouter.fromView, mockView)
        XCTAssertEqual(mockRouter.url, testURL)
    }
    
    func testNavigateToNotificationsScreen() {
        sut.notifications = MockNotifications.mockInstance
        sut.navigateToNotifications(fromView: mockView)
        XCTAssertTrue(mockRouter.navigateToNotificationsCalled)
        XCTAssertEqual(mockRouter.fromView, mockView)
        XCTAssertEqual(mockRouter.notifications, sut.notifications)
    }
    
    func testNavigateToNotificationsScreen_WithoutNotifications() {
        sut.notifications = []
        sut.navigateToNotifications(fromView: mockView)
        XCTAssertTrue(mockRouter.navigateToLoadingCalled)
        
        mockApiClient.getNotifications{}
        
        XCTAssertTrue(self.mockApiClient.getNotificationsCalled)
        XCTAssertEqual(self.mockRouter.fromView, self.mockView)
    }
    
    func testShowBottomSheet() {
        sut.showBottomSheet(fromView: mockView)
        XCTAssertTrue(mockRouter.showBottomSheetCalled)
        XCTAssertEqual(mockRouter.fromView, mockView)
    }
    
    func testnavigateToSendScreen(){
        sut.navigateToSendScreen(fromView: mockView)
        XCTAssertTrue(mockRouter.navigateToSendScreenCalled)
    }
    
    func testGetAccountsAmount() {
        let mockAccounts = MockUserDataModel.mockInstance.accounts
        sut.getAccountsAmount(accounts: mockAccounts)
        XCTAssertTrue(mockApiClient.getAccountsAmountCalled)
        XCTAssertEqual(mockApiClient.accounts, mockAccounts)
    }
    
    
    func testUpdateNotifications() {
        let notifications: [NotificationDataModel] = MockNotifications.mockInstance
        sut.updateNotifications(notifications: notifications)
        XCTAssertEqual(sut.notifications, notifications)
    }
    
    func testUpdateUserDataModel() {
        let accounts: [UserDataModel.Account] = MockUserDataModel.mockInstance.accounts
        _ = self.expectation(forNotification: NSNotification.Name("UserDataModelUpdated"), object: nil, handler: nil)
        
        sut.updateUserDataModel(accounts: accounts)
        
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error, "Error: \(error?.localizedDescription ?? "")")
            XCTAssertEqual(self.sut.userDataModel.accounts, accounts)
        }
    }
}
