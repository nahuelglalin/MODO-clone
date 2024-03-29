//
//  SettingsAvatar.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import UIKit
import SwiftUI

class SettingsAvatar: UIView {
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-SemiBold", size: 19)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-SemiBold", size: 19)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-Regular", size: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarView: UIView = {
        let view = UIImageView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightPaymentGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-SemiBold", size: 20)
        label.textColor = .secondaryPaymentGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let avatarImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 30
//        imageView.layer.masksToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func configure(with user: User) {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        phoneNumberLabel.text = "📱 \(user.phoneNumber)"
        // avatarImageView.image = UIImage(named: user.image)
        avatarText.text = "\(user.firstName.first!)\(user.lastName.first!)"
    }

    private func setupUI() {
        // addSubview(avatarImageView)
        addSubview(avatarView)
        avatarView.addSubview(avatarText)
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(phoneNumberLabel)
        
        NSLayoutConstraint.activate([
            avatarText.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarText.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 60),
            avatarView.heightAnchor.constraint(equalToConstant: 60),
            
            firstNameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10),
            firstNameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor),
            firstNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: 10),
            
            lastNameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 10),
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor),
            lastNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: 10),

            phoneNumberLabel.leadingAnchor.constraint(equalTo: lastNameLabel.leadingAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 5),
        ])
    }
}

struct SettingsAvatarPreview: PreviewProvider {
    static var previews: some View {
        ViewPreview { SettingsAvatar() }
    }
}

