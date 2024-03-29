//
//  AddNewCardButton.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

class AddNewButton: UIButton {
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icChevron")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setText(text: String) {
        label.text = text
    }
    
    private func setupButton() {
        addSubview(icon)
        addSubview(label)
        addSubview(chevronIcon)
        
        icon.image = UIImage(systemName: "plus")
        icon.tintColor = .primaryPaymentGreen
        label.text = "Asociar una nueva tarjeta"
        label.font =  UIFont(name: "RedHatDisplay-Regular", size: 14)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.heightAnchor.constraint(equalToConstant: 25),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            
            chevronIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chevronIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronIcon.widthAnchor.constraint(equalToConstant: 30),
            chevronIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
