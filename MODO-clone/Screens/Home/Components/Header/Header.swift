//
//  Header.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

public class Header: UIView {
    var dataView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var notificationIcon: Icon!
    @IBOutlet weak var avatarWithoutImage: UIView!
    @IBOutlet weak var avatarName: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI(borderColor: UIColor? = nil) {
        dataView = self.loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        avatarWithoutImage.layer.masksToBounds = true
        avatarWithoutImage.layer.cornerRadius = avatarWithoutImage.frame.height / 2
        
        helloLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 20)
        usernameLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 20)
        avatarName.font = UIFont(name: "RedHatDisplay-SemiBold", size: 18)
        notificationIcon.setup(icon: UIImage(named: "notification-modo"))
    }
}

public extension Header {
    func setup(
        imageUrl: String?,
        firstName: String,
        lastName: String
    ) {
        if (imageUrl != nil) {
            self.avatarImage.imageFrom(url: URL(string: imageUrl!)!)
        }
        self.usernameLabel.text = "\(firstName) 👋"
        self.avatarName.text = "\(firstName.first!)\(lastName.first!)"
    }
}

