//
//  LoginMocks.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 20/02/2024.
//

import Foundation
import UIKit
@testable import MODO_clone


class MockLoginRouter: LoginRouterProtocol {
    var navigateToDniScreenCalled = false
    var navigateToPasswordScreenCalled = false
    var navigateToHomeCalled = false
    var fromView: UIViewController?

    func navigateToDniScreen(fromView: UIViewController) {
        navigateToDniScreenCalled = true
        self.fromView = fromView
    }

    func navigateToPasswordScreen(fromView: UIViewController) {
        navigateToPasswordScreenCalled = true
        self.fromView = fromView
    }

    func navigateToHome(fromView: UIViewController, userDataModel: UserDataModel, feedDataModel: [FeedDataModel], promosDataModel: PromosDataModel) {
        navigateToHomeCalled = true
        self.fromView = fromView
    }
    
    func navigateToLoading(fromView: UIViewController) {
    }
    
    func navigateToError(fromView: UIViewController) {
    }
}

class MockAPIClient: APIClient {
    var checkLoginCredentialsCalled = false
    var makeLoginCalled = false
    var stubCheckLoginCredentialsError = false
    // var delegate: APICLientDelegate?

    override func checkLoginCredentials(loginCredentials: LoginCredentials, completion: @escaping () -> Void) {
        checkLoginCredentialsCalled = true
        if stubCheckLoginCredentialsError {
            // delegate?.handleLoginError()
        } else {
            completion()
        }
    }

    override func makeLogin(loginCredentials: LoginCredentials, completion: @escaping () -> Void) {
        makeLoginCalled = true
        // Simula el comportamiento de makeLogin
        // Puedes agregar más lógica según sea necesario
        completion()
    }
    // Agrega más funciones según sea necesario para simular el comportamiento del cliente API.
}


class MockPasswordViewDelegate: PasswordViewDelegate {
    // Implementa las funciones del protocolo según sea necesario para tus pruebas
    var showLoadingCalled = false
    var showPasswordErrorLabelCalled = false

    func showLoading(_ show: Bool) {
        showLoadingCalled = true
    }

    func showPasswordErrorLabel(_ show: Bool, attemptsRemaining: Int) {
        showPasswordErrorLabelCalled = true
    }
}

class MockPasswordViewController: PasswordViewController {
    var navigateToDniScreenCalled = false
    var navigateToPasswordScreenCalled = false
    var navigateToHomeCalled = false
    var showLoadingCalled = false
    var showPasswordErrorLabelCalled = false

    func navigateToDniScreen() {
        navigateToDniScreenCalled = true
    }

    func navigateToPasswordScreen() {
        navigateToPasswordScreenCalled = true
    }

    func navigateToHome() {
        navigateToHomeCalled = true
    }
}
