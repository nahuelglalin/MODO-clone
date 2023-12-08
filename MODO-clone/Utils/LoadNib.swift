//
//  LoadNib.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/12/2023.
//

import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let uiNib = UINib(nibName: nibName, bundle: bundle)
        return uiNib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
