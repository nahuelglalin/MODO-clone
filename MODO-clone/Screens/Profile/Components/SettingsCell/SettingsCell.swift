//
//  SettingsCell.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import UIKit

// Componente: celda individual de la lista en la screen de settings
class SettingsCell: UITableViewCell {
    
    // 1er prop
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 2da prop
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RedHatDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    // 3era prop
    private var labelColor: UIColor?

    // Icon
    private let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icChevron")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
  
        return imageView
    }()
    
    // inicializador del componente, es como el constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(icon)
        addSubview(label)
        addSubview(chevronIcon)
        backgroundColor = UIColor.backgroundColorModo
        if let labelColor = labelColor {
              label.textColor = labelColor
          }
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            icon.widthAnchor.constraint(equalToConstant: 35),
            icon.heightAnchor.constraint(equalToConstant: 35),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            
            chevronIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            chevronIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronIcon.widthAnchor.constraint(equalToConstant: 30),
            chevronIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // inicializador obligatorio al crear la vista por código
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Setting) {
        icon.image = UIImage(named: model.icon)
        label.text = model.label
    }
    
    public func configure(model: Setting, labelColor: UIColor? = nil) {
        icon.image = UIImage(named: model.icon)
        label.text = model.label
        self.labelColor = labelColor
        if let labelColor = labelColor {
            label.textColor = labelColor
        } else {
            label.textColor = .black
        }
    }
    
}
