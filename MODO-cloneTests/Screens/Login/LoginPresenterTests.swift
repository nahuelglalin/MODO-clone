//
//  LoginPresenterTests.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 20/02/2024.
//

import XCTest
@testable import MODO_clone

final class LoginPresenterTests: XCTestCase {
    var sut: LoginPresenter!
    var mockRouter: MockLoginRouter!
    var mockApiClient: MockAPIClient!
    var mockPasswordViewDelegate: MockPasswordViewDelegate!
    var mockPasswordView: MockPasswordViewController!
    
    override func setUpWithError() throws {
          mockRouter = MockLoginRouter()
          mockApiClient = MockAPIClient()
          mockPasswordViewDelegate = MockPasswordViewDelegate()
          mockPasswordView = MockPasswordViewController()
          
          sut = LoginPresenter(currentView: mockPasswordView)
          sut.router = mockRouter
          sut.apiClient = mockApiClient
          sut.passwordViewDelegate = mockPasswordViewDelegate
      }
    
    override func tearDownWithError() throws {
            sut = nil
            mockRouter = nil
            mockApiClient = nil
            mockPasswordViewDelegate = nil
            mockPasswordView = nil
        }

        func testGoToPasswordScreen() {
            sut.goToPasswordScreen(fromView: mockPasswordView)
            XCTAssertEqual(UserDataManager.shared.dni, MOCK_LOGIN_CREDENTIALS.dni)
            XCTAssertEqual(UserDataManager.shared.gender, MOCK_LOGIN_CREDENTIALS.gender)
            XCTAssertEqual(UserDataManager.shared.phoneNumber, MOCK_LOGIN_CREDENTIALS.phoneNumber)
            XCTAssertTrue(mockRouter.navigateToPasswordScreenCalled)
            XCTAssertEqual(mockRouter.fromView, mockPasswordView)
        }

        func testGoHomeWithCorrectCredentials() {
            let loginCredentials = MOCK_LOGIN_CREDENTIALS
            sut.goHome(fromView: mockPasswordView, loginCredentials: loginCredentials)
            XCTAssertTrue(mockApiClient.checkLoginCredentialsCalled)
            XCTAssertTrue(mockApiClient.makeLoginCalled)
        }

        func testGoHomeWithIncorrectCredentials() {
            let loginCredentials = MOCK_LOGIN_CREDENTIALS
            mockApiClient.stubCheckLoginCredentialsError = true
            
            sut.goHome(fromView: mockPasswordView, loginCredentials: loginCredentials)

            XCTAssertTrue(mockApiClient.checkLoginCredentialsCalled)
            XCTAssertFalse(mockApiClient.makeLoginCalled)
            XCTAssertFalse(mockRouter.navigateToHomeCalled)
            XCTAssertTrue(mockPasswordViewDelegate.showLoadingCalled)
            XCTAssertTrue(mockPasswordViewDelegate.showPasswordErrorLabelCalled)
        }
}
