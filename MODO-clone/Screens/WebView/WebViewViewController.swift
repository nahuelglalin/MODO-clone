//
//  WebViewViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 12/01/2024.
//
import UIKit
import WebKit
import Lottie

class WebViewViewController: UIViewController {

    var urlToShow: String = ""
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loadingSpinner: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        guard let url = URL(string: urlToShow) else { return }
        webView.load(URLRequest(url: url))
        webView.isInspectable = true
        
        loadingSpinner.contentMode = .scaleAspectFit
        loadingSpinner.loopMode = .loop
        loadingSpinner.play()
        
        // Event listener
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonPressed))
        backButton.addGestureRecognizer(backButtonTapGesture)
        backButton.isUserInteractionEnabled = true
        
        backButton.layer.shadowColor = UIColor.black.cgColor
        backButton.layer.shadowOpacity = 0.4
        backButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        backButton.layer.shadowRadius = 10
        backButton.layer.shadowPath = UIBezierPath(rect: backButton.bounds).cgPath
        backButton.layer.shouldRasterize = true
        backButton.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configureTopBar(){
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func backButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
}
