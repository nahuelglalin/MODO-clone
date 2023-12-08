//
//  Promotion.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

class PromotionDto {
    var image: UIImage?
    
    required init(image: UIImage) {
        self.image = image
    }
}

class Promotion: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
