//
//  ErrorViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/01/2024.
//

import UIKit

class ErrorViewController: UIViewController {
    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func actionButton(_ sender: UIButton) {
        backButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        
        titleLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        descriptionLabel.font = UIFont(name: "RedHatDisplay-Regular", size: 14)
        actionBtn.layer.cornerRadius = 12
    }
    
    func configureTopBar(){
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}
