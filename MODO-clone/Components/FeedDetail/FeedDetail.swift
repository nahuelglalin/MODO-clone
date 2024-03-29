//
//  FeedDetail.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 12/01/2024.
//

import UIKit

class FeedDetail: UIView {
    var dataView: UIView = UIView()
    
    @IBOutlet weak var headerCell: FeedCell!
    @IBOutlet weak var paymentMethodTitle: UILabel!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var installments: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var paymentID: UILabel!
    @IBOutlet weak var referenceID: UILabel!
    
    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var splitButton: UIButton!
    
    @IBOutlet weak var helpText: UILabel!
    @IBOutlet weak var cancelText: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        dataView = loadNib()
        addSubview(dataView)
        dataView.frame = self.bounds
        dataView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // TODO: consumir esto desde donde corresponda
        headerCell.setup(imageUrl: "https://assets.mobile.playdigital.com.ar/images/merchants/categories/Ctg-Grandes-tiendas.png", title: "Reintegro MODO 🎉", desc: "Recibiste dinero - 22 nov", amount: "+$3.300")
        
        paymentMethodTitle.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        bankName.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        installments.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        
        date.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
        idText.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
        paymentID.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
        referenceID.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
        
        ticketButton.titleLabel?.font = UIFont(name: "RedHatDisplay-Regular", size: 17)
        splitButton.titleLabel?.font = UIFont(name: "RedHatDisplay-Regular", size: 17)

        helpText.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
        cancelText.font = UIFont(name: "RedHatDisplay-Regular", size: 15)
    }
}
