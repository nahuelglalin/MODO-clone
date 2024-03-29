//
//  Activity.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 08/12/2023.
//

import UIKit

protocol FeedViewDelegate: AnyObject {
    func didShowBottomSheet()
}

class FeedView: UIView {
    var dataView: UIView!
    var feedDataModel: [FeedDataModel]? = []
    weak var delegate: FeedViewDelegate?
    
    @IBOutlet weak var firstItem: FeedCell!
    @IBOutlet weak var secondItem: FeedCell!
    @IBOutlet weak var thirdItem: FeedCell!
    @IBOutlet weak var fourthItem: FeedCell!
    @IBOutlet weak var fifthItem: FeedCell!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    override func layoutSubviews() {
        
        guard let feedDataModel = feedDataModel else {
            return
        }
        
        let feedItems = [firstItem, secondItem, thirdItem, fourthItem, fifthItem]
        
        for (index, dataModel) in feedDataModel.prefix(feedItems.count).enumerated() {
            let imageUrl = dataModel.image
            let title = dataModel.feed_data.payment.merchant_name
            let desc = dataModel.type == "PAYMENT" ? "Pagaste" : ""
            let amount = dataModel.category == "EGRESS" ? "-\(dataModel.amount)" : "+\(dataModel.amount)"
            
            feedItems[index]!.setup(imageUrl: imageUrl, title: title, desc: desc, amount: amount)
        }
        
        // Event listener
        let feedItemTapGesture = UITapGestureRecognizer(target: self, action: #selector(showBottomSheet))
        firstItem.addGestureRecognizer(feedItemTapGesture)
        firstItem.isUserInteractionEnabled = true
    }
    
    @objc func showBottomSheet(){
        delegate?.didShowBottomSheet()
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
    }
    
}
