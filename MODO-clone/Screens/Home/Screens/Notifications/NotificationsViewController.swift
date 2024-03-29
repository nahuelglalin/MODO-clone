//
//  NotificationsViewController.swift
//  MODO-clone
//
//  Created by Julieta Ferraris on 1/10/24.
//

import UIKit

class NotificationsViewController: UIViewController {
    @IBOutlet weak var notificationsTable: UITableView!
    var notifications: [NotificationDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTopBar()
        notificationsTable.dataSource = self
        notificationsTable.register(UINib(nibName: "NotificationTableCell", bundle: nil), forCellReuseIdentifier: "NotificationCellIdentifier")
        notificationsTable.estimatedRowHeight = 68.0
        notificationsTable.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureTopBar(){
        navigationController?.isNavigationBarHidden = false
        self.title = "Notificaciones 🔔"
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.label
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonPressed(){
        navigationController?.popToRootViewController(animated: true)
    }
}

extension NotificationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = notifications[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCellIdentifier", for: indexPath) as! NotificationTableCell
        
        if let imageUrl = notification.image, let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        cell.notificationImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        if notification.image == Optional("null") {
            cell.notificationImage.image = UIImage(systemName: "bell.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.primaryPaymentGreen, renderingMode: .alwaysOriginal)
        }
        
        cell.notificationTitle.text = notification.title
        cell.notificationText.text = (notification.body)
        cell.notificationDate.text = notification.time
        
        return cell
    }
    
    
}
