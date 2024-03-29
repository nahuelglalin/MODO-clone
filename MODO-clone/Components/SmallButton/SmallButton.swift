//
//  SmallButton.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/12/2023.
//

import UIKit

class SmallButton: UIView {
    var dataView: UIView = UIView()
    
    @IBOutlet weak var button: UIButton!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        dataView = loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.primaryPaymentGreen.cgColor
        self.backgroundColor = UIColor.backgroundColorModo
        self.button.titleLabel?.font =  UIFont(name: "RedHatDisplay-SemiBold", size: 13)
    }
}

extension SmallButton {
    func setup(
        text: String,
        icon: UIImage
    ) {
        self.button.setTitle("  \(text)", for: .normal)
        self.button.setImage(icon, for: .normal)
    }
}
