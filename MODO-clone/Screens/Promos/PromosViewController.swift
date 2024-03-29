import UIKit
import WebKit
import Lottie

let PROMOS_WEBVIEW = "https://www.modo.com.ar/promos?webview=true"

class PromosViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    
        guard let promosUrl = URL(string: PROMOS_WEBVIEW) else { return }
        webView.load(URLRequest(url: promosUrl))
    }
}
