//
//  ProfileData.swift
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
