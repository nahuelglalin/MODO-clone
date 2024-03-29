//
//  PhoneViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit

class PhoneViewController: UIViewController {
    var presenter: PhonePresenterProtocol? = nil
    @IBOutlet weak var phoneInput: PhoneInput!
    @IBOutlet weak var conditionsCheckbox: Checkbox!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var btnContainerBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        
        continueBtn.isEnabled = false
        continueBtn.backgroundColor = UIColor.lightGrayModo
        continueBtn.layer.cornerRadius = 12
        
        phoneInput.input.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .editingChanged)
        
        conditionsCheckbox.checkboxBtn.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .touchUpInside)
        
        // Keyboard Management
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func checkIfBtnIsEnabled(){
        continueBtn.isEnabled = phoneInput.isPhoneValid() && conditionsCheckbox.isChecked()
        continueBtn.backgroundColor = continueBtn.isEnabled ? UIColor.primaryPaymentGreen : UIColor.lightGrayModo
    }
    
    func configureTopBar(){
        self.title = "Ingresá tu Celular"
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnContinue(_ sender: UIButton) {
        UserDataManager.shared.phoneNumber = phoneInput.input.text
        presenter?.navigateToPasswordScreen(fromView: self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            btnContainerBottomConstraint.constant = keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        btnContainerBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
           NotificationCenter.default.removeObserver(self)
       }
}
