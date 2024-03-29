//
//  ProfileModel.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 07/12/2023.
//

import Foundation

struct Setting {
    let label: String
    let icon: String
}

struct User {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let image: String
    
    init(firstName: String, lastName: String, phoneNumber: String, image: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.image = image
    }
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
