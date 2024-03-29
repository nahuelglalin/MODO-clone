//
//  LoginRouter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

protocol LoginRouterProtocol: AnyObject {
    func navigateToDniScreen(fromView: UIViewController)
    func navigateToPasswordScreen(fromView: UIViewController)
    func navigateToHome(fromView: UIViewController, userDataModel: UserDataModel, feedDataModel: [FeedDataModel], promosDataModel: PromosDataModel)
    func navigateToLoading(fromView: UIViewController)
    func navigateToError(fromView: UIViewController)
}

class LoginRouter: LoginRouterProtocol {
    
    func navigateToDniScreen(fromView: UIViewController) {
        let storyboard = UIStoryboard(name: "Dni", bundle: nil)
        if let dniVc = storyboard.instantiateViewController(withIdentifier: "DniStoryboard") as? DniViewController {
            dniVc.presenter = DniPresenter(router: DniRouter())
            fromView.navigationController?.pushViewController(dniVc, animated: true)
        }
    }
    
    func navigateToHome(fromView: UIViewController, userDataModel: UserDataModel, feedDataModel: [FeedDataModel], promosDataModel: PromosDataModel) {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "TabBarNavigation", bundle: nil)
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "TabBarStoryboard") as? TabBarNavigation {
                mainViewController.userDataModel = userDataModel
                mainViewController.feedDataModel = feedDataModel
                mainViewController.promosDataModel = promosDataModel
                mainViewController.modalPresentationStyle = .fullScreen
                fromView.present(mainViewController, animated: false)
            }
        }
    }
    
    func navigateToPasswordScreen(fromView: UIViewController){
        let storyboard = UIStoryboard(name: "Password", bundle: nil)
        if let passwordVc = storyboard.instantiateViewController(withIdentifier: "PasswordStoryboard") as? PasswordViewController {
            passwordVc.presenter = PasswordPresenter(loginPresenter: LoginPresenter(currentView: passwordVc))
            fromView.navigationController?.pushViewController(passwordVc, animated: true)
        }
    }
    
    func navigateToLoading(fromView: UIViewController){
        let storyboard = UIStoryboard(name: "Loading", bundle: nil)
        if let loadingVc = storyboard.instantiateViewController(withIdentifier: "LoadingStoryboard") as? LoadingViewController {
            loadingVc.modalPresentationStyle = .fullScreen
            fromView.navigationController?.pushViewController(loadingVc, animated: true)
        }
    }
    
    func navigateToError(fromView: UIViewController){
        let storyboard = UIStoryboard(name: "Error", bundle: nil)
        if let errorVc = storyboard.instantiateViewController(withIdentifier: "ErrorStoryboard") as? ErrorViewController {
            fromView.navigationController?.pushViewController(errorVc, animated: true)
        }
    }
    
    
}




