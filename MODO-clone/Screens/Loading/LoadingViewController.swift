//
//  LoadingViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit
import Lottie

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        tabBarController?.tabBar.isHidden = true
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func configureTopBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
