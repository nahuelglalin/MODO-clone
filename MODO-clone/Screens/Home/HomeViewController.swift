import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol? = nil
    
    public var feedDataModel: [FeedDataModel]?
    public var promosDataModel: PromosDataModel?
    
    var isFirstRender = true
    
    @IBOutlet weak var header: Header!
    @IBOutlet weak var eyeIcon: Icon!
    
    @IBOutlet weak var paymentButton: HomeButton!
    @IBOutlet weak var sendButton: HomeButton!
    
    @IBOutlet weak var requestButton: SmallButton!
    @IBOutlet weak var gamingButton: SmallButton!
    @IBOutlet weak var rechargeButton: SmallButton!
    
    @IBOutlet weak var accountsCarousel: UICollectionView!
    @IBOutlet weak var promosCarousel: UICollectionView!
    
    @IBOutlet weak var feedView: FeedView!
    
    @IBOutlet weak var viewMorePromos: UILabel!
    @IBOutlet weak var merchantsMap: UIImageView!
    
    let accountCollectionViewCellId = "Account"
    let promosCollectionViewCellId = "Promotion"
    
    var accounts = [AccountDto]()
    var promos = [PromotionDto]()
    
    var isEyeClosed = false

    
    override func viewWillAppear(_ animated: Bool) {
        if isFirstRender {
            NotificationCenter.default.addObserver(self, selector: #selector(renderAccountsCarousel), name: NSNotification.Name("UserDataModelUpdated"), object: nil)
            presenter?.getAccountsAmount(accounts: (presenter?.userDataModel.accounts)!)
            isFirstRender = false
        }
    }
    
    @objc func renderAccountsCarousel() {
        let accountsData: [AccountDto] = (presenter?.userDataModel.accounts.map { account in
            return AccountDto(
                imageUrl: account.bank.image_url,
                bankName: account.bank.name,
                amount: account.balance,
                lastDigits: account.last_digits,
                isFavorite: account.favourite,
                isAmountHidden: isEyeClosed
            )
        })!
        accounts = accountsData
        accounts.sort { $0.isFavorite && !$1.isFavorite }
        accountsCarousel.reloadData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Header
        // TODO: usar datos del back
        header.setup(imageUrl: presenter!.userDataModel.image, firstName: presenter!.userDataModel.first_name, lastName:  presenter!.userDataModel.last_name )
        eyeIcon.setup(icon: UIImage(named: "eye-opened"))
        
        // Accounts
        let nibCell = UINib(nibName: accountCollectionViewCellId, bundle: nil)
        accountsCarousel.register(nibCell, forCellWithReuseIdentifier: accountCollectionViewCellId)
        renderAccountsCarousel()
        
        // Send & Payment buttons
        paymentButton.setup(text: "Pagar", backgroundColor: .primaryPaymentGreen, image: UIImage(named: "pay-modo")!)
        paymentButton.backgroundColor = .none
        sendButton.setup(text: "Enviar", backgroundColor: .blueModo, image: UIImage(named: "send-modo")!)
        sendButton.backgroundColor = .none
        
        // Small Buttons
        requestButton.setup(text: "Pedir", icon: UIImage(named: "request-modo")!)
        gamingButton.setup(text: "Gaming", icon: UIImage(named: "gaming-modo")!)
        rechargeButton.setup(text: "Recargas", icon: UIImage(named: "recharge-modo")!)
        
        // Promotions
        let mappedPromos: [PromotionDto] = self.promosDataModel!.cards.map { card in
            let imageUrl = card.content.image.optional_images_pack.landscape_app
            return PromotionDto(imageUrl: imageUrl, promoUrl: card.cta_value)
        }
        let promotionCell = UINib(nibName: promosCollectionViewCellId, bundle: nil)
        promosCarousel.register(promotionCell, forCellWithReuseIdentifier: promosCollectionViewCellId)
        promos = mappedPromos
        promosCarousel.reloadData()
        
        //Feed
        feedView.delegate = self
        feedView.feedDataModel = self.feedDataModel
        
        // EyeIcon Event listener
        let eyeIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(eyeIconTapped))
        eyeIcon.addGestureRecognizer(eyeIconTapGesture)
        eyeIcon.isUserInteractionEnabled = true
        
        // Promos Event listener
        let morePromosTapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToPromosScreen))
        viewMorePromos.addGestureRecognizer(morePromosTapGesture)
        viewMorePromos.isUserInteractionEnabled = true
        
        // Merchants map Event listener
        let merchantsMapTapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToMap))
        merchantsMap.addGestureRecognizer(merchantsMapTapGesture)
        merchantsMap.isUserInteractionEnabled = true
        
        // Notifications Event listener
        let notificationIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(notificationIconTapped))
        header.notificationIcon.addGestureRecognizer(notificationIconTapGesture)
        header.notificationIcon.isUserInteractionEnabled = true
        
        // Notifications Event listener
        let sendButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(sendButtonTapped))
        sendButton.addGestureRecognizer(sendButtonTapGesture)
        sendButton.isUserInteractionEnabled = true
    }
    
    @objc func notificationIconTapped() {
        presenter?.navigateToNotifications(fromView: self)
    }
    
    @objc func eyeIconTapped() {
        eyeIcon.setup(icon: isEyeClosed ? UIImage(named: "eye-closed") : UIImage(named: "eye-opened"))
        isEyeClosed.toggle()
        renderAccountsCarousel()
    }
    
    @objc func navigateToPromosScreen() {
        presenter?.navigateToPromosScreen(fromView: self)
    }
    
    @objc func navigateToMap() {
        presenter?.navigateToWebView(fromView: self, withUrl: MERCHANTS_MAP_URL)
    }
    
    @objc func sendButtonTapped(){
        presenter?.navigateToSendScreen(fromView: self)
    }
    

}

// Accounts & Promos carousel
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
            cell.setupUI(imageUrl: account.imgUrl!, bankName: account.bankName!, amount: account.amount, lastDigits: account.lastDigits!, isFavorite: account.isFavorite, isAmountHidden: isEyeClosed)
            return cell
            
        } else if collectionView == promosCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: promosCollectionViewCellId, for: indexPath) as! Promotion
            let promo = promos[indexPath.row]
            
            // Event listener
            let promoTapGesture = PromoTapGesture(target: self, action: #selector(promoTapped))
            cell.addGestureRecognizer(promoTapGesture)
            cell.isUserInteractionEnabled = true
            promoTapGesture.promoUrl = promo.promoUrl
            cell.image.imageFrom(url: URL(string: promo.imageUrl)!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    @objc func promoTapped(sender : PromoTapGesture) {
        presenter?.navigateToWebView(fromView: self, withUrl: sender.promoUrl)
    }
}

class PromoTapGesture: UITapGestureRecognizer {
    var promoUrl = String()
}

extension HomeViewController: FeedViewDelegate {
    func didShowBottomSheet() {
        presenter?.showBottomSheet(fromView: self)
    }
}
