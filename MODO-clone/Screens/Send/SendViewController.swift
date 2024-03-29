//
//  SendViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/02/2024.
//

import UIKit

class SendViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = true
    }
}
