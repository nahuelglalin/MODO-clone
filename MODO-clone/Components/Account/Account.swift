//
//  Account.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

class AccountDto {
    var id: Int?
    var img: UIImage?
    var bankName: String?
    var amount: String?
    var lastDigits: String?
    
    required init(image: UIImage, bankName: String, amount: String, lastDigits: String) {
        self.img = image
        self.bankName = bankName
        self.amount = amount
        self.lastDigits = "CA · \(lastDigits)"
    }
}

class Account: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var lastDigits: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGrayModo.cgColor
        bankName.font = UIFont(name: "RedHatDisplay-SemiBold", size: 13)
        amount.font = UIFont(name: "RedHatDisplay-Regular", size: 24)
        lastDigits.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
    }
}
