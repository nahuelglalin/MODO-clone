//
//  TabBarNavigation.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import UIKit

class TabBarNavigation: UITabBarController {
    var userDataModel: UserDataModel? = nil
    var feedDataModel: [FeedDataModel]? = []
    var promosDataModel: PromosDataModel? = nil
    
    func addPromosButton() {
        let storyboard = UIStoryboard(name: "Promos", bundle: nil)
        if let promosView = storyboard.instantiateViewController(withIdentifier: "PromosStoryboard") as? PromosViewController {
            let button = UITabBarItem(title: "Promos", image: UIImage(named: "promos-modo"), tag: 1)
            promosView.tabBarItem = button
            viewControllers?.append(promosView)
        }
    }
    
    func addWalletButton() {
        let walletView = WalletViewController(userDataModel: self.userDataModel!)
        let button = UITabBarItem(title: "Billetera", image: UIImage(named: "wallet-modo"), tag: 2)
        walletView.tabBarItem = button
        viewControllers?.append(walletView)
    }
    
    func addProfileButton() {
        let profileVc = ProfileViewController(userDataModel: self.userDataModel!)
        let button = UITabBarItem(title: "Más", image: UIImage(named: "more-modo"), tag: 3)
        profileVc.tabBarItem = button
        viewControllers?.append(profileVc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TabBar Init
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let homeVc = storyboard.instantiateViewController(withIdentifier: "HomeStoryboard") as? HomeViewController {
            let navigationController = UINavigationController(rootViewController: homeVc)
            navigationController.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(named: "home-modo"), tag: 0)
            homeVc.presenter = HomePresenter(router: HomeRouter(), userDataModel: self.userDataModel!)
            homeVc.feedDataModel = self.feedDataModel
            homeVc.promosDataModel = self.promosDataModel
            self.setViewControllers([navigationController], animated: true)
        }
        
        addPromosButton()
        addWalletButton()
        addProfileButton()
    }
}
