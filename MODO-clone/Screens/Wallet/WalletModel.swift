//
//  WalletModel.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/01/2024.
//

import UIKit

struct CardModel {
    let bankName: String
    let bankLogoUrl: String
    let lastDigits: String
    let expirationDate: String
    let issuerLogo: String
    let issuerName: String
    let type: String
    let background: String
    let cardColor: UIColor
}

struct AccountModel {
    let bankLogoUrl: String
    let bankName: String
    let isFavorite: Bool
}


