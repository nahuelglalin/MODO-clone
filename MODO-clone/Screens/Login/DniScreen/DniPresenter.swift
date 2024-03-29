//
//  DniPresenter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation
import UIKit

protocol DniPresenterProtocol: AnyObject {
    func navigateToPhoneScreen(fromView: UIViewController) -> Void
}

class DniPresenter: DniPresenterProtocol {
    var router: DniRouterProtocol
    
    init(router: DniRouterProtocol) {
        self.router = router
    }
    
    func navigateToPhoneScreen(fromView: UIViewController) {
        router.navigateToPhoneScreen(fromView: fromView)
    }
}
