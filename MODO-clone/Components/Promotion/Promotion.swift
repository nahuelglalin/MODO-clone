//
//  Promotion.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit
import Lottie

class PromotionDto {
    var imageUrl: String
    var promoUrl: String
    
    required init(imageUrl: String, promoUrl: String) {
        self.imageUrl = imageUrl
        self.promoUrl = promoUrl
    }
}

class Promotion: UICollectionViewCell {
    @IBOutlet weak var skeleton: LottieAnimationView!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 14
        layer.masksToBounds = true
        skeleton.contentMode = .scaleAspectFit
        skeleton.loopMode = .loop
        skeleton.play()
    }
}
