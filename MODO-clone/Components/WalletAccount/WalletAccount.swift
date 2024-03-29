//
//  WalletAccount.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 10/02/2024.
//

import UIKit

class WalletAccount: UIView {
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .primaryPaymentGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-SemiBold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favoriteImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .primaryPaymentGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icChevron")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(icon)
        addSubview(label)
        addSubview(favoriteImg)
        addSubview(chevronIcon)
        favoriteImg.image = UIImage(systemName: "star.fill")
        label.text = "Banco BBVA"
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            icon.widthAnchor.constraint(equalToConstant: 25),
            icon.heightAnchor.constraint(equalToConstant: 25),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            
            favoriteImg.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 12),
            favoriteImg.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            favoriteImg.widthAnchor.constraint(equalToConstant: 15),
            favoriteImg.heightAnchor.constraint(equalToConstant: 15),
            
            chevronIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chevronIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronIcon.widthAnchor.constraint(equalToConstant: 30),
            chevronIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(with account: AccountModel) {
        icon.imageFrom(url: URL(string: account.bankLogoUrl)!)
        label.text = account.bankName
        favoriteImg.image = account.isFavorite ? UIImage(systemName: "star.fill") : nil
    }
}
