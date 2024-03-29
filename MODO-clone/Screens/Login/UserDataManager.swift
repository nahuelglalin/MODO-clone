//
//  UserDataManager.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 23/01/2024.
//

import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    private let userDefaults = UserDefaults.standard
    
    private let dniKey = "dniKey"
    private let genderKey = "genderKey"
    private let phoneNumberKey = "phoneNumberKey"
    private let passwordKey = "passwordKey"
    
    var dni: String? {
        get { return userDefaults.string(forKey: dniKey) }
        set { userDefaults.set(newValue, forKey: dniKey) }
    }
    
    var gender: String? {
        get { return userDefaults.string(forKey: genderKey) }
        set { userDefaults.set(newValue, forKey: genderKey) }
    }
    
    var phoneNumber: String? {
          get { return userDefaults.string(forKey: phoneNumberKey) }
          set { userDefaults.set(newValue, forKey: phoneNumberKey) }
      }
    
    var password: String? {
          get { return userDefaults.string(forKey: passwordKey) }
          set { userDefaults.set(newValue, forKey: passwordKey) }
      }
    
    func clearUserData() {
        userDefaults.removeObject(forKey: dniKey)
        userDefaults.removeObject(forKey: genderKey)
        userDefaults.removeObject(forKey: phoneNumberKey)
        userDefaults.removeObject(forKey: passwordKey)
    }
}
