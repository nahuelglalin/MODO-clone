//
//  GenderInput.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit

class GenderInput: UIView {
    var dataView: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var mGenderBtn: UIButton!
    @IBOutlet weak var fGenderBtn: UIButton!
    @IBOutlet weak var nbGenderBtn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
        title.font = UIFont(name: "RedHatDisplay-SemiBold", size: 17)
        mGenderBtn.titleLabel?.font =  UIFont(name: "RedHatDisplay-Regular", size: 14)
        fGenderBtn.titleLabel?.font =  UIFont(name: "RedHatDisplay-Regular", size: 14)
        nbGenderBtn.titleLabel?.font =  UIFont(name: "RedHatDisplay-Regular", size: 14)
        descriptionLabel.font = UIFont(name: "RedHatDisplay-Regular", size: 12)
    }
    
    private func resetButtons() {
        mGenderBtn.isSelected = false
        fGenderBtn.isSelected = false
        nbGenderBtn.isSelected = false
        mGenderBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        fGenderBtn.setImage(UIImage(named: "checkbox"), for: .normal)
        nbGenderBtn.setImage(UIImage(named: "checkbox"), for: .normal)
    }
    
    @IBAction func didTapOnMGender(_ sender: UIButton) {
        resetButtons()
        mGenderBtn.setImage(UIImage(named: "checkbox-fill"), for: .normal)
        mGenderBtn.isSelected = true
    }
    
    @IBAction func didTapOnFGender(_ sender: UIButton) {
        resetButtons()
        fGenderBtn.setImage(UIImage(named: "checkbox-fill"), for: .normal)
        fGenderBtn.isSelected = true
    }
    
    @IBAction func didTapOnNbGender(_ sender: UIButton) {
        resetButtons()
        nbGenderBtn.setImage(UIImage(named: "checkbox-fill"), for: .normal)
        nbGenderBtn.isSelected = true
    }
    
    func isGenderSelected() -> Bool {
        return mGenderBtn.isSelected || fGenderBtn.isSelected || nbGenderBtn.isSelected
    }
    
    func getGenderSelected() -> String? {
        if mGenderBtn.isSelected {
            return "M"
        } else if fGenderBtn.isSelected {
            return "F"
        } else {
            return "NB"
        }
    }
}
