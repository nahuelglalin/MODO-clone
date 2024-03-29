//
//  Account.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit
import Lottie

class AccountDto {
    var id: Int?
    var imgUrl: String?
    var bankName: String?
    var amount: Float?
    var lastDigits: String?
    var isFavorite: Bool
    var isAmountHidden: Bool
    
    required init(imageUrl: String, bankName: String, amount: Float?, lastDigits: String, isFavorite: Bool, isAmountHidden: Bool) {
        self.imgUrl = imageUrl
        self.bankName = bankName
        self.amount = amount
        self.lastDigits = "CA · \(lastDigits)"
        self.isFavorite = isFavorite
        self.isAmountHidden = isAmountHidden
    }
}

class Account: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var lastDigits: UILabel!
    @IBOutlet weak var favoriteImg: UIImageView!
    @IBOutlet weak var skeleton: LottieAnimationView!
    @IBOutlet weak var imgSkeleton: LottieAnimationView!
    var isAmountHided = false;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 14
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGrayModo.cgColor
        bankName.font = UIFont(name: "RedHatDisplay-SemiBold", size: 13)
        amount.font = UIFont(name: "RedHatDisplay-Regular", size: 24)
        lastDigits.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
        configureSkeletons()
    }
    
    func configureSkeletons() {
        skeleton.isHidden = false
        skeleton.layer.cornerRadius = 10
        skeleton.contentMode = .scaleAspectFit
        skeleton.loopMode = .loop
        skeleton.play()
        
        imgSkeleton.layer.cornerRadius = imgSkeleton.frame.height / 2
        imgSkeleton.layer.cornerRadius = 10
        imgSkeleton.contentMode = .scaleAspectFill
        imgSkeleton.loopMode = .loop
        imgSkeleton.play()
    }
    
    func setupUI(imageUrl: String, bankName: String, amount: Float?, lastDigits: String, isFavorite: Bool, isAmountHidden: Bool){
        self.img.imageFrom(url: URL(string: imageUrl)!)
        self.bankName.text = bankName
        
        if amount == nil {
            skeleton.isHidden = false
        } else {
            skeleton.isHidden = true
            self.amount.text = isAmountHidden ? " · · · ·" : formatAmount(String(amount!))
        }
        
        self.lastDigits.text = lastDigits
        if (!isFavorite) {
            favoriteImg.isHidden = true
        } else {
            favoriteImg.isHidden = false
        }
    }
    
    
}
