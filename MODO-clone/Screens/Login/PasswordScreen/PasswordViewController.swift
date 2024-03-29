//
//  PasswordViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import UIKit
import Lottie

class PasswordViewController: UIViewController, NumberButtonDelegate, PasswordViewDelegate {    
    var presenter: PasswordPresenter? = nil
    
    // Password Label
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var insetPasswordText: UILabel!
    
    //Number Buttons
    @IBOutlet weak var oneBtn: NumberButton!
    @IBOutlet weak var twoBtn: NumberButton!
    @IBOutlet weak var threeBtn: NumberButton!
    @IBOutlet weak var fourBtn: NumberButton!
    @IBOutlet weak var fiveBtn: NumberButton!
    @IBOutlet weak var sixBtn: NumberButton!
    @IBOutlet weak var sevenBtn: NumberButton!
    @IBOutlet weak var eightBtn: NumberButton!
    @IBOutlet weak var nineBtn: NumberButton!
    @IBOutlet weak var faceIdBtn: NumberButton!
    @IBOutlet weak var ceroBtn: NumberButton!
    @IBOutlet weak var eraseBtn: NumberButton!
    @IBOutlet weak var eyeIcon: UIImageView!
    
    @IBOutlet weak var loadingContainer: UIView!
    @IBOutlet weak var loadingAnimation: LottieAnimationView!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!

    // Additional Buttons
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var changedNumberBtn: UIButton!
    
    var isEyeClosed = true
    
    var enteredPassword = "" {
        didSet {
            passwordLabel.text = String(repeating: "⦁", count: enteredPassword.count).trimmingCharacters(in: .whitespaces)
        }
    }
    
    override func viewDidLoad() {
        configTopBarUI()
        setupKeypadUI()
        insetPasswordText.font = UIFont(name: "RedHatDisplay-SemiBold", size: 12)
        passwordLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 40)
        
        presenter?.delegate = self
        
        let numberButtons = [oneBtn, twoBtn, threeBtn, fourBtn, fiveBtn, sixBtn, sevenBtn, eightBtn, nineBtn, ceroBtn, eraseBtn, faceIdBtn]
        for button in numberButtons {
            button?.delegate = self
        }
        
        let eyeTapGesture = UITapGestureRecognizer(target: self, action: #selector(eyeIconTapped))
        eyeIcon.addGestureRecognizer(eyeTapGesture)
        eyeIcon.isUserInteractionEnabled = true
        
        passwordErrorLabel.isHidden = true
        loadingContainer.isHidden = true
        
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.loopMode = .loop
        loadingAnimation.play()
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func configTopBarUI(){
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupKeypadUI(){
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "RedHatDisplay-SemiBold", size: 13)
        changedNumberBtn.titleLabel?.font = UIFont(name: "RedHatDisplay-SemiBold", size: 13)
        oneBtn.setup(number: "1", letters: "")
        twoBtn.setup(number: "2", letters: "A B C")
        threeBtn.setup(number: "3", letters: "D E F")
        fourBtn.setup(number: "4", letters: "G H I")
        fiveBtn.setup(number: "5", letters: "J K L")
        sixBtn.setup(number: "6", letters: "M N O")
        sevenBtn.setup(number: "7", letters: "P Q R S")
        eightBtn.setup(number: "8", letters: "T U V")
        nineBtn.setup(number: "9", letters: "W X Y Z")
        ceroBtn.setup(number: "0", letters: "")
        eraseBtn.setup(icon: UIImage(named: "erase")!)
        faceIdBtn.setup(icon: UIImage(named: "face-id")!)
    }
    
    func updatePasswordLabel() {
        let displayedPassword = String(enteredPassword.suffix(6))
        let greenCount = min(displayedPassword.count, 6)
        
        let pwWithDots = "⦁" + String(repeating: "⦁", count: max(0, 5))
        let pwToSave = displayedPassword + String(repeating: "⦁", count: max(0, 6 - enteredPassword.count))
        let pwToShow = isEyeClosed ? pwWithDots : pwToSave
        
        let passwordAttributedString = NSMutableAttributedString(string: "")
        for (index, char) in pwToShow.enumerated() {
            let color: UIColor
            var font: UIFont = UIFont(name: "RedHatDisplay-SemiBold", size: 40)!
            
            if index < greenCount && !char.isNumber {
                color = UIColor.primaryPaymentGreen
            } else if char.isNumber {
                color = UIColor.label
                font = UIFont(name: "RedHatDisplay-SemiBold", size: 18)!
            } else {
                color = UIColor.darkGrayModo
            }
            
            let attributedChar = NSAttributedString(string: String(char), attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font, NSAttributedString.Key.baselineOffset: char.isNumber ? 10 : 0])
            passwordAttributedString.append(attributedChar)
        }
        
        passwordLabel.attributedText = passwordAttributedString
        presenter?.writePassword(pwToSave, fromView: self)
    }
    
    @objc func eyeIconTapped(){
        isEyeClosed.toggle()
        
        eyeIcon.image = isEyeClosed ? UIImage(named: "eye-closed") : UIImage(named: "eye-opened")
        updatePasswordLabel()
    }
    
    func numberButtonPressed(_ sender: NumberButton) {
        if (sender == eraseBtn) {
            eraseButtonPressed()
        } else if (sender == faceIdBtn) {
            loginWithBiometrics()
        } else {
            guard let numberText = sender.number?.text else {
                return
            }
            
            if enteredPassword.count < 6 {
                enteredPassword += numberText
            }
            
            updatePasswordLabel()
        }
    }
    
    func loginWithBiometrics() {
        presenter?.loginWithBiometrics(fromView: self)
    }
    
    func eraseButtonPressed() {
        if !enteredPassword.isEmpty {
            enteredPassword.removeLast()
        }
        updatePasswordLabel()
    }
    
    func clearPassword() {
        for _ in 0..<6 {
            eraseButtonPressed()
        }
    }
    
    func showPasswordErrorLabel(_ show: Bool, attemptsRemaining: Int) {
        DispatchQueue.main.async{
            if (show) {
                self.clearPassword()
                self.passwordErrorLabel.text = "Clave incorrecta. Te quedan \(attemptsRemaining) intentos"
            }
            self.passwordErrorLabel.isHidden = !show
        }
     }
    
    func showLoading(_ show: Bool) {
        DispatchQueue.main.async{
            self.loadingContainer.isHidden = !show
        }
     }
}



