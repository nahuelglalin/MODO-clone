import UIKit
import WebKit

class PromosViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let promosUrl = URL(string: "https://www.modo.com.ar/promos?webview=true") else { return }
        
        webView.load(URLRequest(url: promosUrl))
        
    }


}
