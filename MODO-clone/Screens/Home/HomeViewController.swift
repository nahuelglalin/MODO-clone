import UIKit

let accountsData: [AccountDto] = [
    AccountDto(image: UIImage(named: "accSantander")!, bankName: "Banco Santander", amount: "2.700", lastDigits: "5678"),
    AccountDto(image: UIImage(named: "accNacion")!, bankName: "Banco Nación", amount: "10.278", lastDigits: "9101"),
    AccountDto(image: UIImage(named: "accBbva")!, bankName: "Banco BBVA", amount: "1.586", lastDigits: "8463"),
    AccountDto(image: UIImage(named: "accPatagonia")!, bankName: "Banco Patagonia", amount: "9.500", lastDigits: "2486")
]

let promosData: [PromotionDto] = [
    PromotionDto(image: UIImage(named: "promo1")!),
    PromotionDto(image: UIImage(named: "promo2")!),
    PromotionDto(image: UIImage(named: "promo3")!),
    PromotionDto(image: UIImage(named: "promo4")!),
    PromotionDto(image: UIImage(named: "promo5")!),
    PromotionDto(image: UIImage(named: "promo6")!),
]

class HomeViewController: UIViewController {
    
    @IBOutlet weak var paymentButton: Button!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var sendButton: Button!
    @IBOutlet weak var accountsCarousel: UICollectionView!
    @IBOutlet weak var promosCarousel: UICollectionView!
    
    let accountCollectionViewCellId = "Account"
    let promosCollectionViewCellId = "Promotion"
    
    var accounts = [AccountDto]()
    var promos = [PromotionDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Avatar
        avatarImage.backgroundColor = .primaryPaymentGreen
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        // Accounts
        let nibCell = UINib(nibName: accountCollectionViewCellId, bundle: nil)
        accountsCarousel.register(nibCell, forCellWithReuseIdentifier: accountCollectionViewCellId)
        accounts = accountsData
        accountsCarousel.reloadData()
        
        // Send & Payment buttons
        paymentButton.setup(text: "Pagar", backgroundColor: .primaryPaymentGreen, image: UIImage(named: "pay-modo")!)
        paymentButton.backgroundColor = .none
        sendButton.setup(text: "Enviar", backgroundColor: .blueModo, image: UIImage(named: "send-modo")!)
        sendButton.backgroundColor = .none
        
        // Promotions
        let promotionCell = UINib(nibName: promosCollectionViewCellId, bundle: nil)
        promosCarousel.register(promotionCell, forCellWithReuseIdentifier: promosCollectionViewCellId)
        promos = promosData
        promosCarousel.reloadData()
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           if collectionView == accountsCarousel {
               return accounts.count
           } else if collectionView == promosCarousel {
               return promos.count
           }
           return 0
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == accountsCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountCollectionViewCellId, for: indexPath) as! Account
            let account = accounts[indexPath.row]
            cell.img.image = account.img
            cell.bankName.text = account.bankName
            cell.amount.text = account.amount
            cell.lastDigits.text = account.lastDigits
            return cell
        } else if collectionView == promosCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: promosCollectionViewCellId, for: indexPath) as! Promotion
            let promo = promos[indexPath.row]
            cell.image.image = promo.image
            return cell
        }
        return UICollectionViewCell()
    }
}
