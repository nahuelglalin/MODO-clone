import UIKit

class CardsSection: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private var cardModels: [CardModel] = []
    private let addNewCardButton = AddNewCardButton() // Utiliza tu clase CustomButton
    
    func configure(cards: [CardModel]) {
        cardModels = cards
        setupCards()
    }
    
    private func setupCards() {
        for (index, cardModel) in cardModels.enumerated() {
            let card = Card()
            card.configure(
                bankLogo: cardModel.bankLogo,
                lastDigits: cardModel.lastDigits,
                expirationDate: cardModel.expirationDate,
                cardTypeLogo: cardModel.cardTypeLogo,
                cardColor: cardModel.cardColor
            )
            
            containerView.addSubview(card)
            
            // Configura las constraints para cada card
            card.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                card.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                card.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                card.heightAnchor.constraint(equalToConstant: 200)
            ])
            
            if index == 0 {
                // La primera tarjeta
                card.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            } else {
                // Las tarjetas subsiguientes
                let previousCard = containerView.subviews[index - 1]
                card.topAnchor.constraint(equalTo: previousCard.bottomAnchor, constant: 15).isActive = true
            }
        }
        
        // Asegura que la última tarjeta tenga un margen inferior suficiente
        if let lastCard = containerView.subviews.last {
            lastCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScrollView()
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 160, right: 0)
        
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
            addNewCardButton.heightAnchor.constraint(equalToConstant: 60) // Ajusta la altura según tus necesidades
        ])
    }
}
