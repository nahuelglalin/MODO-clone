//
//  SceneDelegate.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginStoryboard") as? LoginViewController {
            let navigationController = UINavigationController(rootViewController: loginViewController)
            window.rootViewController = navigationController
        }
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

