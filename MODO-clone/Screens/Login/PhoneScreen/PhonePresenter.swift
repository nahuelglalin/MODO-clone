//
//  PhonePresenter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import Foundation
import UIKit

protocol PhonePresenterProtocol: AnyObject {
    func navigateToPasswordScreen(fromView: UIViewController) -> Void
}

class PhonePresenter: PhonePresenterProtocol {
    var router: PhoneRouterProtocol
    
    init(router: PhoneRouterProtocol) {
        self.router = router
    }
    
    func navigateToPasswordScreen(fromView: UIViewController) {
        router.navigateToPasswordScreen(fromView: fromView)
    }
}
