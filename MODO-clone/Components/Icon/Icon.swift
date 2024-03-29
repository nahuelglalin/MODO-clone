//
//  Icon.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

public class Icon: UIView {
    var dataView: UIView!
    @IBOutlet weak var icon: UIImageView!
    
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
        layer.cornerRadius = 14
        layer.masksToBounds = true
    }
    
}

public extension Icon {
    func setup(
        icon: UIImage?
    ) {
        self.icon.image = icon
    }
}

