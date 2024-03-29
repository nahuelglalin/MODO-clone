//
//  HomePresenter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

let MERCHANTS_MAP_URL = "https://www.modo.com.ar/mapa?webview=true"

protocol HomePresenterProtocol: AnyObject {
    func navigateToPromosScreen(fromView: UIViewController)
    func navigateToWebView(fromView: UIViewController, withUrl: String)
    func navigateToNotifications(fromView: UIViewController)
    func showBottomSheet(fromView: UIViewController)
    func getAccountsAmount(accounts: [UserDataModel.Account])
    func navigateToSendScreen(fromView: UIViewController)
    var userDataModel: UserDataModel { get set }
}

class HomePresenter: HomePresenterProtocol {
    var router: HomeRouterProtocol
    var homeApiClient: HomeApiClient
    var notifications: [NotificationDataModel] = []
    
    public var userDataModel: UserDataModel

    init(router: HomeRouterProtocol, userDataModel: UserDataModel) {
        self.router = router
        self.homeApiClient = HomeApiClient()
        self.userDataModel = userDataModel
        self.homeApiClient.delegate = self
    }
    
    func navigateToPromosScreen(fromView: UIViewController) {
        router.navigateToPromosScreen(fromView: fromView)
    }
    
    func navigateToWebView(fromView: UIViewController, withUrl: String) {
        router.navigateToWebView(fromView: fromView, withUrl: withUrl)
    }
    
    func navigateToNotifications(fromView: UIViewController) {
        AmplitudeMetrics.logEvent(NOTIFICATIONS_BUTTON_PRESSED)
        if notifications.count > 0 {
            self.router.navigateToNotifications(fromView: fromView, notifications: self.notifications)
        } else {
            self.router.navigateToLoading(fromView: fromView)
            homeApiClient.getNotifications {
                self.router.navigateToNotifications(fromView: fromView, notifications: self.notifications)
            }
        }
    }
    
    func showBottomSheet(fromView: UIViewController) {
        AmplitudeMetrics.logEvent(FEED_BOTTOM_SHEET_SHOWED)
        self.router.showBottomSheet(fromView: fromView)
    }
    
    func getAccountsAmount(accounts: [UserDataModel.Account]) {
        self.homeApiClient.getAccountsAmount(accounts: accounts)
    }
    
    func navigateToSendScreen(fromView: UIViewController){
        AmplitudeMetrics.logEvent(SEND_BTN_PRESSED)
        self.router.navigateToSendScreen(fromView: fromView)
    }
}

extension HomePresenter: HomeApiClientDelegate {
    func updateNotifications(notifications: [NotificationDataModel]) {
        self.notifications = notifications
    }
    
    func updateUserDataModel(accounts: [UserDataModel.Account]) {
        self.userDataModel.accounts = accounts
        NotificationCenter.default.post(name: NSNotification.Name("UserDataModelUpdated"), object: nil)
    }
}
