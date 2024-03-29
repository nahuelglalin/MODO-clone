import UIKit

class WalletViewController: UIViewController {
    public var userDataModel: UserDataModel
    let customHeaderView = WalletHeader()
    let cardsSection = CardsSection()
    let accountsSection = AccountsSection()
    var cardModels: [CardModel] = []
    var accountModels: [AccountModel] = []
    
    let cardsButton = UIButton()
    let accountsButton = UIButton()
    
    init(userDataModel: UserDataModel) {
        self.userDataModel = userDataModel
        super.init(nibName: nil, bundle: nil)
        
        for cardData in userDataModel.cards {
            let cardModel = CardModel(
                bankName: cardData.bank!.name,
                bankLogoUrl: cardData.bank_logo,
                lastDigits: cardData.last_digits,
                expirationDate: cardData.expiry,
                issuerLogo: cardData.issuer_logo,
                issuerName: cardData.issuer_name,
                type: cardData.type,
                background: cardData.issuer_background_logo,
                cardColor: hexStringToUIColor(hex: cardData.card_color)
            )
            cardModels.append(cardModel)
        }
        cardsSection.configure(cards: cardModels)
        
        for accountData in userDataModel.accounts {
            
            let isDuplicated = accountModels.contains { $0.bankName == accountData.bank.name }
            
            if !isDuplicated {
                let accountModel = AccountModel(
                    bankLogoUrl: accountData.bank.image_url,
                    bankName: accountData.bank.name,
                    isFavorite: accountData.favourite
                )
                accountModels.append(accountModel)
            }
        }
        
        accountsSection.configure(accounts: accountModels)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorModo
        view.addSubview(customHeaderView)
        cardsButton.isSelected = true
        configureButton(cardsButton, title: "TARJETAS")
        configureButton(accountsButton, title: "CUENTAS")
        
        let buttonStackView = UIStackView(arrangedSubviews: [cardsButton, accountsButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 8
        
        view.addSubview(buttonStackView)
        view.addSubview(cardsSection)
        view.addSubview(accountsSection)
        accountsSection.isHidden = true
        
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        cardsSection.translatesAutoresizingMaskIntoConstraints = false
        accountsSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            customHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            customHeaderView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            customHeaderView.heightAnchor.constraint(equalToConstant: 100),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStackView.topAnchor.constraint(equalTo: customHeaderView.bottomAnchor),
            
            cardsSection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cardsSection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            cardsSection.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16),
            cardsSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            
            accountsSection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            accountsSection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            accountsSection.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16),
            accountsSection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //Event listeners
        cardsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        accountsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func configureButton(_ button: UIButton, title: String) {
        var configuration = UIButton.Configuration.filled()
        button.setTitle(title, for: .normal)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14)
        
        if button.isSelected {
            configuration.baseBackgroundColor = .darkBlueModo
        } else {
            configuration.baseBackgroundColor = .lightGrayModo
        }
        
        button.setAttributedTitle(NSAttributedString(string: title, attributes: [
            .font: UIFont(name: "RedHatDisplay-SemiBold", size: 12)!,
            .foregroundColor: button.isSelected ? UIColor.white : UIColor.darkGray
        ]), for: .normal)
        
        configuration.cornerStyle = .capsule
        button.configuration = configuration
    }
    
    @objc func buttonTapped(sender: UIButton) {
        cardsButton.isSelected = (sender == cardsButton)
        accountsButton.isSelected = (sender == accountsButton)
        configureButton(cardsButton, title: "TARJETAS")
        configureButton(accountsButton, title: "CUENTAS")
        cardsSection.isHidden = accountsButton.isSelected
        accountsSection.isHidden = cardsButton.isSelected
    }
}

