//
//  DniRouter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

protocol DniRouterProtocol: AnyObject {
    func navigateToPhoneScreen(fromView: UIViewController) -> Void
}

class DniRouter: DniRouterProtocol {
    func navigateToPhoneScreen(fromView: UIViewController) {
        let storyboard = UIStoryboard(name: "Phone", bundle: nil)
        if let phoneVc = storyboard.instantiateViewController(withIdentifier: "PhoneStoryboard") as? PhoneViewController {
            phoneVc.presenter = PhonePresenter(router: PhoneRouter())
            fromView.navigationController?.pushViewController(phoneVc, animated: true)
        }
    }
}
