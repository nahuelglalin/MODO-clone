//
//  Input.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit

class DniInput: UIView {
    var dataView: UIView!
    
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var inputContainer: UIView!
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
    
    @objc func inputTextChanged() {
        if let text = input.text, (text.count == 7 || text.count == 8) {
            validationImage.image = UIImage(named: "validation")
        } else {
            validationImage.image = nil
        }
    }
    
    func updateValidationImage() {
        validationImage.image = nil
    }
    
    private func setupUI() {
        dataView = self.loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        input.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        dniLabel.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        descriptionLabel.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
        
        setupInputBorder()
    }
    
    func setupInputBorder() {
        input.borderStyle = .none
        
        let borderBottom = UIView()
        borderBottom.backgroundColor = UIColor.darkGrayModo
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        
        inputContainer.addSubview(borderBottom)
        
        NSLayoutConstraint.activate([
            borderBottom.leadingAnchor.constraint(equalTo: inputContainer.leadingAnchor),
            borderBottom.trailingAnchor.constraint(equalTo: inputContainer.trailingAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: input.bottomAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func isDniValid() -> Bool {
        if let text = input.text, (text.count == 7 || text.count == 8) {
            return true
        }
        return false
    }
    
}
