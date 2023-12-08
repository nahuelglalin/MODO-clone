import UIKit
import SwiftUI

struct CardModel {
    let bankLogo: UIImage?
    let lastDigits: String
    let expirationDate: String
    let cardTypeLogo: UIImage?
    let cardColor: UIColor
}

class WalletViewController: UIViewController {

    let customHeaderView = WalletHeader()
    let cardsSection = CardsSection()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configura las cards
        let cardModels = [
            CardModel(
                bankLogo: UIImage(named: "Santander"),
                lastDigits: "1234",
                expirationDate: "12/25",
                cardTypeLogo: UIImage(named: "icVisaCredit"),
                cardColor: .redSantander
            ),
            CardModel(
                bankLogo: UIImage(named: "Ciudad"),
                lastDigits: "5678",
                expirationDate: "7/28",
                cardTypeLogo: UIImage(named: "icMaster"),
                cardColor: .black
            ),
            CardModel(
                bankLogo: UIImage(named: "Nacion"),
                lastDigits: "9101",
                expirationDate: "12/26",
                cardTypeLogo: UIImage(named: "icVisaDebit"),
                cardColor: .blueCiudad
            ),
            CardModel(
                bankLogo: UIImage(named: "BBVA"),
                lastDigits: "9101",
                expirationDate: "12/26",
                cardTypeLogo: UIImage(named: "icVisaCredit"),
                cardColor: .blueBbva
            )
        ]


        // Configura las tarjetas en el CardsSection
        cardsSection.configure(cards: cardModels)

        // Agrega las vistas al view principal
        view.addSubview(customHeaderView)
        view.addSubview(cardsSection)

        // Configura las constraints
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        cardsSection.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            customHeaderView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            customHeaderView.heightAnchor.constraint(equalToConstant: 100),

            cardsSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cardsSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cardsSection.topAnchor.constraint(equalTo: customHeaderView.bottomAnchor),
            cardsSection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40)
        ])
    }
}


struct WalletViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview { WalletViewController() }
    }
}
