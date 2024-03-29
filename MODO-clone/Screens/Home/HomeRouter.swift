//
//  HomeRouter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    func navigateToPromosScreen(fromView: UIViewController)
    func navigateToWebView(fromView: UIViewController, withUrl: String)
    func navigateToNotifications(fromView: UIViewController, notifications: [NotificationDataModel])
    func navigateToLoading(fromView: UIViewController)
    func showBottomSheet(fromView: UIViewController)
    func navigateToSendScreen(fromView: UIViewController)
}

class HomeRouter: HomeRouterProtocol {
    
    func navigateToPromosScreen(fromView: UIViewController) {
        if let tabBarController = fromView.tabBarController {
            tabBarController.selectedIndex = 1
        }
    }
    
    
    func navigateToWebView(fromView: UIViewController, withUrl: String) {
        let storyboard = UIStoryboard(name: "WebView", bundle: nil)
        if let webViewVc = storyboard.instantiateViewController(withIdentifier: "WebviewStoryboard") as? WebViewViewController {
            webViewVc.urlToShow = withUrl
            fromView.navigationController?.pushViewController(webViewVc, animated: true)
        }
    }
    
    func showBottomSheet(fromView: UIViewController) {
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        if let bottomSheetVc = storyboard.instantiateViewController(withIdentifier: "BottomSheetStoryboard") as? BottomSheetViewController {
        fromView.present(bottomSheetVc, animated: true)
        }
    }
    
    func navigateToLoading(fromView: UIViewController) {
        let storyboard = UIStoryboard(name: "Loading", bundle: nil)
        if let loadingVc = storyboard.instantiateViewController(withIdentifier: "LoadingStoryboard") as? LoadingViewController {
            fromView.navigationController?.pushViewController(loadingVc, animated: true)
        }
    }
    
    func navigateToNotifications(fromView: UIViewController, notifications: [NotificationDataModel]) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Notifications", bundle: nil)
            if let notificationsVc = storyboard.instantiateViewController(withIdentifier: "NotificationsStoryboard") as? NotificationsViewController {
                notificationsVc.notifications = notifications
                fromView.navigationController?.pushViewController(notificationsVc, animated: false)
            }
        }
    }
    
    func navigateToSendScreen(fromView: UIViewController) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Send", bundle: nil)
            if let sendVc = storyboard.instantiateViewController(withIdentifier: "SendStoryboard") as? SendViewController {
                fromView.navigationController?.pushViewController(sendVc, animated: true)
            }
        }
    }
    
}

