//
//  PhoneInput.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import UIKit

class PhoneInput: UIView {
    var dataView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var inputContainer: UIView!
    @IBOutlet weak var numberPrefix: UILabel!
    @IBOutlet weak var validationImage: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        input.addTarget(self, action: #selector(inputTextChanged), for: .editingChanged)
        updateValidationImage()
    }
    
    func updateValidationImage() {
        validationImage.image = nil
    }
    
    private func setupUI() {
        dataView = self.loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        numberPrefix.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        input.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        titleLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        descriptionLabel.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
        
        setupInputBorder()
    }
    
    func setupInputBorder() {
        input.borderStyle = .none
        
        let borderBottom = UIView()
        borderBottom.backgroundColor = UIColor.gray
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        
        inputContainer.addSubview(borderBottom)
        
        NSLayoutConstraint.activate([
            borderBottom.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor),
            borderBottom.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: inputContainer.bottomAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    @objc func inputTextChanged() {
        if let text = input.text, (text.count >= 10 && text.count <= 12) {
            validationImage.image = UIImage(named: "validation")
        } else {
            validationImage.image = nil
        }
    }
    
    func isPhoneValid() -> Bool {
        if let text = input.text, (text.count >= 10 && text.count <= 12) {
            return true
        }
        return false
    }
}

