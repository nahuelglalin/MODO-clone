//
//  FormatAmount.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 19/01/2024.
//

import Foundation

func formatAmount(_ amount: String) -> String {
    if let amountDouble = Double(amount) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: amountDouble)) {
            return formattedAmount
        }
    }
    return amount
}
