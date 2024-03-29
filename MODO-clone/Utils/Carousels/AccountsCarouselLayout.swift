//
//  AccountsCarouselLayout.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 22/01/2024.
//

import UIKit

class AccountsCarouselLayout: UICollectionViewFlowLayout {
    
    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    func setupLayout() {
        scrollDirection = .horizontal
        minimumLineSpacing = 8
        minimumInteritemSpacing = 0
        itemSize = CGSize(width: 250, height: 125)
        sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let cv = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = cv.numberOfItems(inSection: 0)
        
        if previousOffset > cv.contentOffset.x && velocity.x < 0.0 {
            currentPage = max(currentPage-1, 0)
        } else if previousOffset < cv.contentOffset.x && velocity.x > 0.0 {
            currentPage = min(currentPage+1, itemCount-1)
        }
        
        let w = cv.frame.width
        let itemW = 250.00
        let sp = minimumLineSpacing
        let edge = (w - itemW - sp*2) / 2
        let offset = (itemW + sp) * CGFloat(currentPage) - (edge + sp)
        
        previousOffset = offset
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
    
    
}
