//
//  ProfileViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/12/2023.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    public var userDataModel: UserDataModel
    let user: User
    
    init(userDataModel: UserDataModel){
        self.userDataModel = userDataModel
        user = User(firstName: self.userDataModel.first_name, lastName: self.userDataModel.last_name, phoneNumber: self.userDataModel.phone_number, image: "profile")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        return nil
    }

    let userCardView = SettingsAvatar();
    
    let optionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorModo
        
        optionsTableView.dataSource = self
        optionsTableView.delegate = self
        optionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        optionsTableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        optionsTableView.backgroundColor = UIColor.backgroundColorModo
        userCardView.configure(with: user)
        
        userCardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userCardView)
        view.addSubview(optionsTableView)
        
        NSLayoutConstraint.activate([
            userCardView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            userCardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userCardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userCardView.heightAnchor.constraint(equalToConstant: 100),
            
            optionsTableView.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 10),
            optionsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            optionsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            optionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.row]
        let cell = SettingsCell(style: .default, reuseIdentifier: "settingsCell")
        
        if indexPath.row == settings.count - 1 {
            cell.configure(model: setting, labelColor: .redModo)
        } else {
            cell.configure(model: setting)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        if indexPath.row != settings.count - 1 {
            print("ejecutar navigate")
        } else {
            showAppCloseAlert()
        }
    }
    
    func showAppCloseAlert() {
        AmplitudeMetrics.logEvent(CLOSE_APP_BTN_PRESSED)
        let alertController = UIAlertController(title: "Deseas cerrar la app?", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Cerrar", style: .destructive, handler: { _ in
            UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
}
