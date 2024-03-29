//
//  LoginPresenter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

let FINGERPRINT = "eyJ0aW1lX3N0YW1wIjoiMjAyNC0wMS0wNVQxOTo1ODoyMC4xOThaIiwiZ2VvbG9jYWxpemF0aW9uIjp7ImxhdGl0dWRlIjoiLTM0LjYwMzcyMiIsImxvbmdpdHVkZSI6Ii01OC4zODE1OTIifSwiZGV2aWNlX21vZGVsIjoic2RrX2dwaG9uZTY0X2FybTY0IiwiZGV2aWNlX25hbWUiOiJ1bmtub3duIiwib3NfbmFtZSI6ImFuZHJvaWQiLCJvc192ZXJzaW9uIjozNCwib3NfaWQiOiI2ZjIyZWUzYjBmNjcyOTJhIiwibGFuZ3VhZ2UiOiJlbiIsImVtdWxhdG9yIjp0cnVlLCJoYXJkd2FyZV9pZCI6IjZmMjJlZTNiMGY2NzI5MmEiLCJ1c2VyX2FnZW50IjoiTU9ET0FwcC8xLjc4LjAiLCJmY21fdG9rZW4iOiJkNkNRQWQ5bFJLS1NxOTFFeC1MSVY3OkFQQTkxYkVqYXBqdzJndmxoN0hDMEM4TFNRMFpPMHhEMzhPdTFaTjNiV1I1R2pacTI4T0FqU0hnVjVHU241a2V1VFFEY2RncnMtd0VRb2hhOE41S0VaYTJBOHIwanZJcGtvSUgyU2ZQWldBd0N0aFpyek1MVTliUHBvOGFoVE5TQzM3MWxwVEkxUGxrIn0="

let MOCK_LOGIN_CREDENTIALS = LoginCredentials(
    dni: "39549621",
    email: "",
    phoneNumber: "2213057172",
    gender: "M",
    password: "024680",
    loginType: "Password"
)

protocol LoginPresenterProtocol: AnyObject {
    func goToPasswordScreen(fromView: UIViewController) -> Void
    func goHome(fromView: UIViewController, loginCredentials: LoginCredentials)
    func makeLogin() -> Void
    var passwordViewDelegate: PasswordViewDelegate? { get set }
}

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewControllerProtocol?
    weak var passwordViewDelegate: PasswordViewDelegate?
    weak var passwordView: PasswordViewController?
    var router: LoginRouterProtocol
    var apiClient: APIClient
    var hasLoginError = false
    var loginAttemptsRemaining = 3
    var userDataModel: UserDataModel?
    var feedDataModel: [FeedDataModel]?
    var promosDataModel: PromosDataModel?
    
    init(currentView: PasswordViewController) {
        self.router = LoginRouter()
        self.passwordView = currentView
        self.apiClient = APIClient()
        self.apiClient.delegate = self
    }
    
    init(currentView: LoginViewController) {
        self.router = LoginRouter()
        self.view = currentView
        self.apiClient = APIClient()
        self.apiClient.delegate = self
    }
    
    func makeLogin() {
        self.router.navigateToDniScreen(fromView: self.view as! LoginViewController)
    }
    
    func goToPasswordScreen(fromView: UIViewController) {
        UserDataManager.shared.dni = MOCK_LOGIN_CREDENTIALS.dni
        UserDataManager.shared.gender = MOCK_LOGIN_CREDENTIALS.gender
        UserDataManager.shared.phoneNumber = MOCK_LOGIN_CREDENTIALS.phoneNumber
        
        self.router.navigateToPasswordScreen(fromView: fromView)
    }
    
    func goHome(fromView: UIViewController, loginCredentials: LoginCredentials) {
        self.hasLoginError = false
        self.passwordViewDelegate?.showPasswordErrorLabel(false, attemptsRemaining: loginAttemptsRemaining)
        self.passwordViewDelegate?.showLoading(true)
        apiClient.checkLoginCredentials(loginCredentials: loginCredentials) {
            if (self.hasLoginError) {
                self.passwordViewDelegate?.showLoading(false)
                self.loginAttemptsRemaining -= 1
                AmplitudeMetrics.logEvent(LOGIN_FAILED)
                self.passwordViewDelegate?.showPasswordErrorLabel(true, attemptsRemaining: self.loginAttemptsRemaining)
            } else {
                    self.apiClient.makeLogin(loginCredentials: loginCredentials) {
                        if let userDataModel = self.userDataModel, let feedDataModel = self.feedDataModel, let promosDataModel = self.promosDataModel {
                            AmplitudeMetrics.logEvent(LOGIN_COMPLETED_SUCCESSFULLY)
                            self.router.navigateToHome(fromView: fromView, userDataModel: userDataModel, feedDataModel: feedDataModel, promosDataModel: promosDataModel)
                        }
                    }
                }
        }
    }
}

extension LoginPresenter: APICLientDelegate  {
    func handleLoginError() {
        self.hasLoginError = true
    }
    
    func updateUserModel(user: UserDataModel) {
        self.userDataModel = user
    }
    
    func updateFeedModel(feedData: [FeedDataModel]) {
        self.feedDataModel = feedData
    }
    
    func updatePromosModel(promosData: PromosDataModel) {
        self.promosDataModel = promosData
    }
    
    func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.router.navigateToError(fromView: self.view as! LoginViewController)
        }
    }
}
