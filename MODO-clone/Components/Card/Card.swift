//
//  Card.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import UIKit
import SwiftUI

class Card: UIView {
    var bankLogoImageView = UIView()
    let lastDigitsLabel = UILabel()
    let typeLabel = UILabel()
    let expirationDateLabel = UILabel()
    let issuerTypeView = UIView()
    var cardTypeBackgroundImageView = UIImageView()
    
    var cardColor: UIColor = .white {
        didSet {
            backgroundColor = cardColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = cardColor
        
        addSubview(cardTypeBackgroundImageView)
        cardTypeBackgroundImageView.contentMode = .scaleAspectFit
        cardTypeBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardTypeBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardTypeBackgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            cardTypeBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 70),
            cardTypeBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 80)
        ])
        
        let padding: CGFloat = 60.0
        cardTypeBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -padding).isActive = true
        cardTypeBackgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: -padding).isActive = true
        cardTypeBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding).isActive = true
        cardTypeBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding).isActive = true
        
        addSubview(bankLogoImageView)
        bankLogoImageView.contentMode = .scaleAspectFit
        bankLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(lastDigitsLabel)
        lastDigitsLabel.numberOfLines = 1
        lastDigitsLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        lastDigitsLabel.textColor = .white
        lastDigitsLabel.textAlignment = .left
        lastDigitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(expirationDateLabel)
        expirationDateLabel.numberOfLines = 1
        expirationDateLabel.textColor = .white
        expirationDateLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 12)
        expirationDateLabel.textAlignment = .center
        expirationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(issuerTypeView)
        issuerTypeView.contentMode = .scaleAspectFit
        issuerTypeView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(typeLabel)
        typeLabel.numberOfLines = 1
        typeLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 12)
        typeLabel.textColor = .white
        typeLabel.textAlignment = .right
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            bankLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            bankLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            bankLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            bankLogoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            lastDigitsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lastDigitsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            expirationDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            expirationDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            issuerTypeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            issuerTypeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            issuerTypeView.widthAnchor.constraint(equalToConstant: 80),
            issuerTypeView.heightAnchor.constraint(equalToConstant: 60),
            
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            typeLabel.widthAnchor.constraint(equalToConstant: 80),
            typeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        bringSubviewToFront(issuerTypeView)
    }
    
    func configure(bankName: String, bankLogoUrl: String, lastDigits: String, expirationDate: String, issuerLogo: String, issuerName: String, type: String, background: String, cardColor: UIColor) {
        self.cardColor = cardColor
        
        var bankLogoImg: UIView
        
        // TODO: improve this
        if bankName == "Galicia" || bankName == "Reba" || bankName == "BIND"  || bankName == "Credicoop" {
            let imgView = UIImageView()
            imgView.image = UIImage(named: bankName)
            imgView.translatesAutoresizingMaskIntoConstraints = false
            bankLogoImg = UIView()
            bankLogoImg.addSubview(imgView)
        } else {
            bankLogoImg = UIView(SVGURL: URL(string: bankLogoUrl)!) { (svgLayer) in
                svgLayer.fillColor = UIColor.white.cgColor
            }
        }
        
        self.bankLogoImageView.addSubview(bankLogoImg)
        self.lastDigitsLabel.text = "· · · \(lastDigits)"
        self.expirationDateLabel.text = "Vence \(expirationDate)"
        
        let issuerImg = UIView(SVGURL: URL(string: issuerLogo)!) { (svgLayer) in
            if issuerName == "visa" || issuerName == "confiable" {
                svgLayer.fillColor = UIColor.white.cgColor
            }
        }
        
        self.typeLabel.text = type == "DEBIT" ? "Débito" : "Crédito"
        self.issuerTypeView.addSubview(issuerImg)
        self.cardTypeBackgroundImageView.imageFrom(url: URL(string: background)!)
    }
}
