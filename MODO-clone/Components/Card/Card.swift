//
//  Card.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import UIKit
import SwiftUI

class Card: UIView {
    // Elementos de la tarjeta
    private let bankLogoImageView = UIImageView()
    private let lastDigitsLabel = UILabel()
    private let expirationDateLabel = UILabel()
    private let cardTypeImageView = UIImageView()
    
    // Propiedad para establecer el color de fondo de la tarjeta
    var cardColor: UIColor = .white {
        didSet {
            backgroundColor = cardColor
        }
    }
    
    // Nueva propiedad para el fondo con opacidad
    private let cardTypeBackgroundImageView = UIImageView()
    
    // Inicializador
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // Configuración de la interfaz de usuario
    private func setupUI() {
        // Configurar el fondo de la tarjeta
        backgroundColor = cardColor
        
        // Configurar el fondo con opacidad
        addSubview(cardTypeBackgroundImageView)
        cardTypeBackgroundImageView.contentMode = .scaleAspectFit
        cardTypeBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Establecer restricciones para el fondo con opacidad
        NSLayoutConstraint.activate([
            cardTypeBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cardTypeBackgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            cardTypeBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 70),
            cardTypeBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 80)
        ])
        
        // Ajustar el tamaño del fondo con opacidad (por ejemplo, hacerlo más grande)
        let padding: CGFloat = 60.0
        cardTypeBackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -padding).isActive = true
        cardTypeBackgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: -padding).isActive = true
        cardTypeBackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding).isActive = true
        cardTypeBackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding).isActive = true
        
        
        
        // Configurar el logo del banco
        addSubview(bankLogoImageView)
        bankLogoImageView.contentMode = .scaleAspectFit
        bankLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar el número de la tarjeta
        addSubview(lastDigitsLabel)
        lastDigitsLabel.numberOfLines = 1
        lastDigitsLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        lastDigitsLabel.textColor = .white
        lastDigitsLabel.textAlignment = .left
        lastDigitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar la fecha de vencimiento
        addSubview(expirationDateLabel)
        expirationDateLabel.numberOfLines = 1
        expirationDateLabel.textColor = .white
        expirationDateLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 12)
        expirationDateLabel.textAlignment = .center
        expirationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar el logo de la tarjeta (Visa, MasterCard, etc.)
        addSubview(cardTypeImageView)
        cardTypeImageView.contentMode = .scaleAspectFit
        cardTypeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Agregar bordes redondeados
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        // Establecer restricciones
        NSLayoutConstraint.activate([
            bankLogoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            bankLogoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            bankLogoImageView.widthAnchor.constraint(equalToConstant: 150),
            bankLogoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            lastDigitsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lastDigitsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            expirationDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            expirationDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            cardTypeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardTypeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardTypeImageView.widthAnchor.constraint(equalToConstant: 80),
            cardTypeImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        bringSubviewToFront(cardTypeImageView)
        
    }
    
    // Función para configurar el contenido de la tarjeta
    func configure(bankLogo: UIImage?, lastDigits: String, expirationDate: String, cardTypeLogo: UIImage?, cardColor: UIColor) {
        self.cardColor = cardColor
        bankLogoImageView.image = bankLogo
        lastDigitsLabel.text = "· · · \(lastDigits)"
        expirationDateLabel.text = "Vence \(expirationDate)"
        cardTypeImageView.image = cardTypeLogo
        
        if cardTypeLogo == UIImage(named: "icMaster") {
            cardTypeBackgroundImageView.image = UIImage(named: "master_background")
        } else if (cardTypeLogo == UIImage(named: "icVisaCredit") || cardTypeLogo == UIImage(named: "icVisaDebit")) {
            cardTypeBackgroundImageView.image = UIImage(named: "visa_background")
        } else {
            cardTypeBackgroundImageView.image = nil
        }
        
    }
}
