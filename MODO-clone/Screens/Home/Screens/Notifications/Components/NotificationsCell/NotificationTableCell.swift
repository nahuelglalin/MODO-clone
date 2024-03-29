//
//  NotificationTableViewCell.swift
//  MODO-clone
//
//  Created by Julieta Ferraris on 1/11/24.
//

import UIKit

class NotificationTableCell: UITableViewCell {
    @IBOutlet weak var notificationImage: UIImageView!
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var notificationText: UILabel!
    @IBOutlet weak var notificationDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        notificationImage.layer.cornerRadius = notificationImage.frame.width / 2.0
        notificationTitle.font = UIFont(name: "RedHatDisplay-SemiBold", size: 15)
        notificationText.font = UIFont(name: "RedHatDisplay-Regular", size: 14)
        notificationDate.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
    }
}
