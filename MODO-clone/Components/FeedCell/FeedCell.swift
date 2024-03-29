//
//  ActivityCell.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

public class FeedCell: UIView {
    var dataView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var amount: UILabel!
    
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
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.height / 2
        title.font = UIFont(name: "RedHatDisplay-Regular", size: 16)
        desc.font = UIFont(name: "RedHatDisplay-Regular", size: 10)
        amount.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
    }
    
}

public extension FeedCell {
    func setup(
        imageUrl: String,
        title: String,
        desc: String,
        amount: String
    ) {
        self.image.imageFrom(url: URL(string: imageUrl)!)
        self.title.text = title
        self.desc.text = desc
        self.amount.text = amount
        setAmountText(with: amount)
    }
    
    private func setAmountText(with amount: String) {
        var textColor: UIColor = .black
        var formattedAmount = amount
        
        if amount.hasPrefix("-") {
            textColor = .redModo
        } else if amount.hasPrefix("+") {
            textColor = .primaryPaymentGreen
        }
        
        formattedAmount.remove(at: formattedAmount.startIndex)
        
        let attributedString = NSMutableAttributedString(string: amount)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: NSRange(location: 0, length: 1))
        
        self.amount.attributedText = attributedString
    }
}

