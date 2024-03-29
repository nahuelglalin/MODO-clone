//
//  PasswordPresenter.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/01/2024.
//

import LocalAuthentication
import UIKit

protocol PasswordViewDelegate: AnyObject {
    func showPasswordErrorLabel(_ show: Bool, attemptsRemaining: Int)
    func showLoading(_ show: Bool)
}

protocol PasswordPresenterProtocol: AnyObject {
    func navigateToHome(fromView: PasswordViewController, loginCredentials: LoginCredentials) -> Void
    func writePassword(_ password: String, fromView: PasswordViewController)
    func loginWithBiometrics(fromView: PasswordViewController)
}

class PasswordPresenter: PasswordPresenterProtocol, PasswordViewDelegate {
    var loginPresenter: LoginPresenterProtocol
    weak var delegate: PasswordViewDelegate?
    
    init(loginPresenter: LoginPresenterProtocol) {
        self.loginPresenter = loginPresenter
        loginPresenter.passwordViewDelegate = self
    }
    
    func writePassword(_ password: String, fromView: PasswordViewController) {
        UserDataManager.shared.password = password
        makeLoginWhenPasswordIsCompleted(password, fromView: fromView)
    }
    
    func makeLoginWhenPasswordIsCompleted(_ password: String, fromView: PasswordViewController) {
        let onlyNumbers = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: password))
        
        if let dni = UserDataManager.shared.dni, let phoneNumber = UserDataManager.shared.phoneNumber, let gender = UserDataManager.shared.gender {
            if onlyNumbers {
                let loginCredentials = LoginCredentials(
                    dni: dni,
                    email: "",
                    phoneNumber: "+549\(phoneNumber)",
                    gender: gender,
                    password: password,
                    loginType: "Password"
                )
                self.navigateToHome(fromView: fromView, loginCredentials: loginCredentials)
            }
        }
    }
    
    func loginWithBiometrics(fromView: PasswordViewController){
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Autorizar!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {return}
                    if let dni = UserDataManager.shared.dni, let phoneNumber = UserDataManager.shared.phoneNumber, let gender = UserDataManager.shared.gender {
                        
                        let loginCredentials = LoginCredentials(
                            dni: dni,
                            email: "",
                            phoneNumber: "+549\(phoneNumber)",
                            gender: gender,
                            password: MOCK_LOGIN_CREDENTIALS.password,
                            loginType: "Password"
                        )
                        
                        self?.navigateToHome(fromView: fromView, loginCredentials: loginCredentials)
                    }
                }
            }
        }
    }
    
    func navigateToHome(fromView: PasswordViewController, loginCredentials: LoginCredentials) {
        loginPresenter.goHome(fromView: fromView, loginCredentials: loginCredentials)
    }
    
    func showPasswordErrorLabel(_ show: Bool, attemptsRemaining: Int) {
        delegate?.showPasswordErrorLabel(show, attemptsRemaining: attemptsRemaining)
    }
    
    func showLoading(_ show: Bool) {
        delegate?.showLoading(show)
    }
}
