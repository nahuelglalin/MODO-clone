//
//  DniViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit

class DniViewController: UIViewController {
    var presenter: DniPresenterProtocol? = nil
    @IBOutlet weak var dniInput: DniInput!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var genderInput: GenderInput!
    @IBOutlet weak var continueBtnBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        
        continueBtn.isEnabled = false
        continueBtn.backgroundColor = .lightGrayModo
        continueBtn.layer.cornerRadius = 12
        
        dniInput.input.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .editingChanged)
        genderInput.mGenderBtn.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .touchUpInside)
        genderInput.fGenderBtn.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .touchUpInside)
        genderInput.nbGenderBtn.addTarget(self, action: #selector(checkIfBtnIsEnabled), for: .touchUpInside)
        
        // Keyboard Management
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureTopBar(){
        self.title = "Ingresá tu DNI"
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnContinue(_ sender: UIButton) {
        UserDataManager.shared.dni = dniInput.input.text
        UserDataManager.shared.gender = genderInput.getGenderSelected()
        presenter?.navigateToPhoneScreen(fromView: self)
    }
    
    @objc func checkIfBtnIsEnabled(){
        continueBtn.isEnabled = genderInput.isGenderSelected() && dniInput.isDniValid()
        continueBtn.backgroundColor = continueBtn.isEnabled ? UIColor.primaryPaymentGreen : UIColor.lightGrayModo
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            continueBtnBottomConstraint.constant = keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        continueBtnBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
