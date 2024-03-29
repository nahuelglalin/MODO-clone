//
//  NumberButton.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import UIKit

protocol NumberButtonDelegate: AnyObject {
    func numberButtonPressed(_ sender: NumberButton)
}

class NumberButton: UIView {
    var dataView: UIView!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var letters: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    weak var delegate: NumberButtonDelegate?

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        dataView = self.loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layer.cornerRadius = 10
        layer.masksToBounds = true
        number.font = UIFont(name: "RedHatDisplay-SemiBold", size: 24)
        letters.font = UIFont(name: "RedHatDisplay-SemiBold", size: 10)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.numberButtonPressed(self)
    }
}

extension NumberButton {
    func setup(
        number: String,
        letters: String
    ) {
        self.number.text = number
        self.letters.text = letters
    }
    
    func setup(
        icon: UIImage
    ) {
        self.number.text = ""
        self.letters.text = ""
        self.icon.image = icon
    }
}
