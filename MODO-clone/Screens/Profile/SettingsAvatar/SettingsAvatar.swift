//
//  SettingsAvatar.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import UIKit

class SettingsAvatar: UIView {
    
    // MARK: - UI Components
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func configure(with user: User) {
        nameLabel.text = user.name
        descriptionLabel.text = "📱 +549\(user.description)"
        avatarImageView.image = UIImage(named: user.avatarName)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        // Agrega subvistas y establece restricciones aquí
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        // Añade restricciones para posicionar las subvistas
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 80), // Ajusta el valor según tus necesidades
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
        ])
    }
}
