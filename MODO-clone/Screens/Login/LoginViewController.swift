//
//  LoginViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit
import WebKit
import SwiftSVG

protocol LoginViewControllerProtocol: AnyObject {}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    var presenter: LoginPresenterProtocol?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenter(currentView: self)
        loginButton.layer.cornerRadius = 16
    }
    
    @IBAction func didTapOnLoginButton(_ sender: UIButton) {
        AmplitudeMetrics.logEvent(MAKE_COMPLETE_LOGIN_BTN_PRESSED)
        presenter?.makeLogin()
    }
    
    @IBAction func didTapOnGoHome(_ sender: UIButton) {
        AmplitudeMetrics.logEvent(GO_TO_PW_SCREEN_PRESSED)
        presenter?.goToPasswordScreen(fromView: self)
    }
}
