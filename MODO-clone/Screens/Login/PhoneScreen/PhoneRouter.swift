//
//  PhoneRouter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import Foundation
import UIKit

protocol PhoneRouterProtocol: AnyObject {
    func navigateToPasswordScreen(fromView: UIViewController) -> Void
}

class PhoneRouter: PhoneRouterProtocol {
    
    func navigateToPasswordScreen(fromView: UIViewController) {
        let storyboard = UIStoryboard(name: "Password", bundle: nil)
        if let passwordVc = storyboard.instantiateViewController(withIdentifier: "PasswordStoryboard") as? PasswordViewController {
            passwordVc.presenter = PasswordPresenter(loginPresenter: LoginPresenter(currentView: passwordVc))
            fromView.navigationController?.pushViewController(passwordVc, animated: true)
        }
    }
    
}
