//
//  MoreViewController.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 06/12/2023.
//
import UIKit

struct Setting {
    let label: String
    let icon: String
}

struct User {
    let name: String
    let description: String
    let avatarName: String
}

let settings = [
    Setting(label: "Configuración", icon: "icSettings"),
    Setting(label: "QR Personal", icon: "icCodeQR"),
    Setting(label: "Donar con MODO", icon: "icDonate"),
    Setting(label: "Necesitas ayuda?", icon: "icHeadphones"),
    Setting(label: "Invitar amigos", icon: "icInviteFriends"),
    Setting(label: "Ayudanos a mejorar", icon: "icComments"),
    Setting(label: "Legales", icon: "icQuestion"),
    Setting(label: "Cerrar sesión", icon: "icSignout")
]

let user = User(name: "Nahuel Lalin", description: "1135950702", avatarName: "profile")

class MoreViewController: UIViewController, UITableViewDataSource {
    
    private let userCardView = SettingsAvatar(frame: CGRect(x: 0, y: 45, width: 300, height: 100));
    
    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        devicesTableView.dataSource = self
        devicesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        devicesTableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        userCardView.configure(with: user)
        
        view.addSubview(userCardView)
        view.addSubview(devicesTableView)
        
        NSLayoutConstraint.activate([
            userCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            devicesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            devicesTableView.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 8),
            devicesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devicesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devicesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    
    
}
