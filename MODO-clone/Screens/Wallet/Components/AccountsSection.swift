//
//  AccountsSection.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/02/2024.
//

import UIKit
import SwiftUI


 //Account mock
// var accountsMock: [AccountModel] = [
// AccountModel(bankLogoUrl: "https://s3.amazonaws.com/assets.mobile.preprod.playdigital.com.ar/images/banks/modo.png", bankName: "Banco Modo", isFavorite: true),
// AccountModel(bankLogoUrl: "https://s3.amazonaws.com/assets.mobile.preprod.playdigital.com.ar/images/banks/modo.png", bankName: "Banco Modo 2", isFavorite: false),
// AccountModel(bankLogoUrl: "https://s3.amazonaws.com/assets.mobile.preprod.playdigital.com.ar/images/banks/modo.png", bankName: "Banco Modo 2", isFavorite: false)
// ]
 


class AccountsSection: UIView {
    private let walletAccount = WalletAccount()
    private let addNewCardButton = AddNewButton()
    private let divider = Divider()
    private let cbuButton = CbuButton()
    private var accounts: [AccountModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // setupUI()
    }
    
    func configure(accounts: [AccountModel]) {
        self.accounts = accounts
        setupAccounts()
    }
    
//    private func setupUI() {
//        setupAccounts()
//    }
    
    private func setupAccounts() {
        var previousView: UIView?
        
        
        for account in accounts {
            let accountView = WalletAccount()
            accountView.translatesAutoresizingMaskIntoConstraints = false
            accountView.backgroundColor = .lightGrayModo
            accountView.layer.cornerRadius = 16
            self.addSubview(accountView)

            NSLayoutConstraint.activate([
                accountView.topAnchor.constraint(equalTo: previousView?.bottomAnchor ?? self.topAnchor, constant: previousView == nil ? 0 : 8),
                accountView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                accountView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                accountView.heightAnchor.constraint(equalToConstant: 55),
            ])

            accountView.configure(with: account)
            previousView = accountView
        }
        
        
        let addNewCardButton = AddNewButton()
        addNewCardButton.translatesAutoresizingMaskIntoConstraints = false
        addNewCardButton.backgroundColor = .lightGrayModo
        addNewCardButton.layer.cornerRadius = 16
        addNewCardButton.layer.borderWidth = 1
        addNewCardButton.layer.borderColor = UIColor.primaryPaymentGreen.cgColor
        addNewCardButton.setText(text: "Asociar una nueva cuenta")
        self.addSubview(addNewCardButton)
        
        NSLayoutConstraint.activate([
            addNewCardButton.topAnchor.constraint(equalTo: previousView?.bottomAnchor ?? self.topAnchor, constant: previousView == nil ? 0 : 16),
            addNewCardButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addNewCardButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addNewCardButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        
        let divider = Divider()
        divider.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: addNewCardButton.bottomAnchor, constant: 16),
            divider.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
        ])
        
        cbuButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cbuButton)
        
        NSLayoutConstraint.activate([
            cbuButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 8),
            cbuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cbuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cbuButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

struct AccountSectionPreview: PreviewProvider {
    static var previews: some View {
        ViewPreview { AccountsSection() }
    }
}
