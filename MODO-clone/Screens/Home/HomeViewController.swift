import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var paymentButton: Button!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var sendButton: Button!
    @IBOutlet weak var requestButton: Button!
    @IBOutlet weak var gamingButton: Button!
    @IBOutlet weak var rechargeButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImage.backgroundColor = .primaryPaymentGreen
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        paymentButton.setup(text: "Pagar", backgroundColor: .primaryPaymentGreen, image: UIImage(named: "pay-modo")!)
        
        sendButton.setup(text: "Enviar", backgroundColor: .blueModo, image: UIImage(named: "send-modo")!)
        
        requestButton.setup(text: "Pedir", backgroundColor: .white, image: UIImage(named: "request-modo")!, borderColor: .secondaryPaymentGreen, textColor: .black, spacing: 0)
        
        gamingButton.setup(text: "Gaming", backgroundColor: .white, image: UIImage(named: "gaming-modo")!, borderColor: .secondaryPaymentGreen, textColor: .black, spacing: 2)
        
        rechargeButton.setup(text: "Recargas", backgroundColor: .white, image: UIImage(named: "recharge-modo")!, borderColor: .secondaryPaymentGreen, textColor: .black, spacing: 2)
    }
    
}
