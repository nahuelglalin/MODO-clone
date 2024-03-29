//
//  Checkbox.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/01/2024.
//

import UIKit

class Checkbox: UIView {
    var dataView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var checkboxBtn: UIButton!
    
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
        label.font =  UIFont(name: "RedHatDisplay-Regular", size: 14)
        addStylesToLabel()
    }
    
    
    @IBAction func didTapOnCheckbox(_ sender: UIButton) {
        checkboxBtn.isSelected = !checkboxBtn.isSelected
        updateCheckboxImage()
    }
    
    private func updateCheckboxImage() {
        let imageName = checkboxBtn.isSelected ? "checkbox-fill" : "checkbox"
        checkboxBtn.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func addStylesToLabel(){
        let text = "Acepto los términos, condiciones y política de privacidad"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel
        ]
        
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        
        let remarkedText = (text as NSString).range(of: "términos, condiciones y política de privacidad")
        
        let remarkedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label
        ]
        attributedString.addAttributes(remarkedAttributes, range: remarkedText)
        
        label.attributedText = attributedString
    }
    
    func isChecked() -> Bool {
        return checkboxBtn.isSelected
    }
    
}
