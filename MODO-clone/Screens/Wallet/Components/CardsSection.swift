import UIKit

class CardsSection: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private var cardModels: [CardModel] = []
    private let addNewCardButton = AddNewButton()
    
    func configure(cards: [CardModel]) {
        cardModels = cards
        setupCards()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScrollView()
    }
    
    private func setupCards() {
        for (index, cardModel) in cardModels.enumerated() {
            let card = Card()
            card.configure(
                bankName: cardModel.bankName,
                bankLogoUrl: cardModel.bankLogoUrl,
                lastDigits: cardModel.lastDigits,
                expirationDate: cardModel.expirationDate,
                issuerLogo: cardModel.issuerLogo,
                issuerName: cardModel.issuerName,
                type: cardModel.type,
                background: cardModel.background,
                cardColor: cardModel.cardColor
            )
            
            containerView.addSubview(card)
            
            card.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                card.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                card.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                card.heightAnchor.constraint(equalToConstant: 200)
            ])
            
            if index == 0 {
                card.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            } else {
                let previousCard = containerView.subviews[index - 1]
                card.topAnchor.constraint(equalTo: previousCard.bottomAnchor, constant: 15).isActive = true
            }
        }
    
        if let lastCard = containerView.subviews.last {
            lastCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        }
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 260, right: 0)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        addSubview(addNewCardButton)
        addNewCardButton.translatesAutoresizingMaskIntoConstraints = false
        addNewCardButton.backgroundColor = .lightGrayModo
        addNewCardButton.layer.cornerRadius = 16
        
        addNewCardButton.layer.borderWidth = 1
        addNewCardButton.layer.borderColor = UIColor.primaryPaymentGreen.cgColor
       
        NSLayoutConstraint.activate([
            addNewCardButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            addNewCardButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            addNewCardButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 15),
            addNewCardButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
