//
//  SmallButton.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/12/2023.
//

import UIKit

class SmallButtonDto {
    var text: String
    var image: UIImage?
    
    required init(text: String, image: UIImage?) {
        self.text = text
        self.image = image
    }
}

class SmallButton: UIView {
    var dataView: UIView = UIView()

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
        
    private func setupUI() {
        dataView = loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.primaryPaymentGreen.cgColor
        self.backgroundColor = .white
        self.button.titleLabel?.font =  UIFont.init(name: "RedHatDisplay-SemiBold", size: 10)
    }
    
}
