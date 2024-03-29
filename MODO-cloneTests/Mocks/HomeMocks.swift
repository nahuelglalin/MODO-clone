//
//  HomeMocks.swift
//  MODO-cloneTests
//
//  Created by Nahuel Lalin on 19/02/2024.
//

import Foundation
import UIKit
@testable import MODO_clone


class MockHomeRouter: HomeRouterProtocol {
    var navigateToPromosScreenCalled = false
    var navigateToWebViewCalled = false
    var navigateToNotificationsCalled = false
    var navigateToSendScreenCalled = false
    var showBottomSheetCalled = false
    var navigateToLoadingCalled = false
    var getAccountsAmountCalled = false
    
    var fromView: UIViewController?
    var url: String?
    var notifications: [NotificationDataModel]?
    
    func navigateToPromosScreen(fromView: UIViewController) {
        navigateToPromosScreenCalled = true
        self.fromView = fromView
    }
    
    func navigateToWebView(fromView: UIViewController, withUrl: String) {
        navigateToWebViewCalled = true
        self.fromView = fromView
        self.url = withUrl
    }
    
    func navigateToNotifications(fromView: UIViewController, notifications: [NotificationDataModel]) {
        navigateToNotificationsCalled = true
        self.fromView = fromView
        self.notifications = notifications
    }
    
    func showBottomSheet(fromView: UIViewController) {
        showBottomSheetCalled = true
        self.fromView = fromView
    }
    
    func navigateToSendScreen(fromView: UIViewController) {
        navigateToSendScreenCalled = true
        self.fromView = fromView
    }
    
    func navigateToLoading(fromView: UIViewController) {
        navigateToLoadingCalled = true
        self.fromView = fromView
    }
    
    func getAccountsAmount(accounts: [UserDataModel.Account]) {
        getAccountsAmountCalled = true
    }
}

class MockHomeApiClient: HomeApiClient {
    var stubGetNotifications: (() -> Void)?
    var getNotificationsCalled = false
    var getAccountsAmountCalled = false
    var accounts: [UserDataModel.Account]?
    
    override func getNotifications(completion: @escaping () -> Void) {
        stubGetNotifications?()
        getNotificationsCalled = true
    }
    
    override func getAccountsAmount(accounts: [UserDataModel.Account]) {
        getAccountsAmountCalled = true
        self.accounts = accounts
    }
}

class MockViewController: UIViewController {
}

struct MockUserDataModel {
    static let mockInstance: UserDataModel = {
        let jsonString = """
        {"id":"a3188997-0241-4e43-aaff-08008f13ab68",
        "name":"Testmaxin Testparisian",
        "first_name":"Testmaxine",
        "last_name":"Testparisian",
        "created_at":"2022-10-25T17:54:13.854Z",
        "phone_number":"+5491135950702",
        "dni":"41917960",
        "accounts":[{"id":"6239ca56-922c-4a3e-88eb-6d1a95c6f155","last_digits":"1335","type":"SAVINGS","currency_code":"ARS","favourite":true,"bank":{"id":"5ae2042e-6095-4f1d-a956-c430fad05973","name":"Banco Nación","image_url":"https://assets.mobile.preprod.playdigital.com.ar/images/banks/nacion.png"},"schema":"LINKED","createdAt":"2024-01-18T17:48:36.478678+00:00"}],
        "cards":[{"id":"4ed4fb7e-bbd8-43e4-b4e5-3ff7ec58f806","issuer_name":"master","favourite":true,"expiry":"12/24","type":"CREDIT","bin":"550568","last_digits":"5366","expired":false,"bank":{"id":"88d8705e-2dda-46f9-8411-bb4916af858e","name":"Galicia","image_url":"https://assets.mobile.preprod.playdigital.com.ar/images/banks/galicia.png"},"color":null,"card_color":"#0D0D0D","bank_logo":"https://assets.mobile.preprod.playdigital.com.ar/images/banks/cards_logos/7.svg","issuer_logo":"https://assets.mobile.preprod.playdigital.com.ar/images/issuers/master.svg","issuer_background_logo":"https://assets.mobile.preprod.playdigital.com.ar/images/issuers/master_background.png","recently_pushed":false,"enrollment_type":"MANUAL","details_available":false,"cvv_type":"MANUAL","prepaid":false,"card_art":{"active":false}}],
        "email_validated":false,
        "email":"nahuelglalin@gmail.com"
        ,"gender":"M",
        "identity_validation":true,
        "receive_benefits":false,
        "member_get_members_amount":"600",
        "member_get_members_max_amount":"10000",
        "member_get_members_url":"https://assets.mobile.preprod.playdigital.com.ar/images/promotions/member_get_member.png",
        "suggested_banks":[],
        "suggested_banks_by_cards":[{"id":"88d8705e-2dda-46f9-8411-bb4916af858e","name":"Galicia","image_url":"https://assets.mobile.preprod.playdigital.com.ar/images/banks/galicia.png","can_link":true,"automatic_card_linking":true,"favourite":true,"pending_cashback":{"amount":33.02,"quantity":4}}],
        "license_plates":[],
        "image":null}
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserDataModel.self, from: jsonData)
            return user
        } catch {
            fatalError("Error creating mock instance of UserDataModel: \(error)")
        }
    }()
}


struct MockNotifications {
    static let mockInstance: [NotificationDataModel] = {
        let jsonString = """
        [
        {"id":"asd","image":"null","title":"¡Tenés un reintegro pendiente! 🎉","body":"Asociá tu cuenta del Banco Nación 🏦 a MODO para que podamos acreditarlo.","time":"2024-01-22T17:18:30.455Z","url":"https://assets.mobile.preprod.playdigital.com.ar/","read":true},
        {"id":"123","image":"null","title":"¡Tenés un reintegro pendiente! 🎉","body":"Asociá tu cuenta del Banco Nación 🏦 a MODO para que podamos acreditarlo.","time":"2024-01-22T17:18:29.941Z","url":"https://assets.mobile.preprod.playdigital.com.ar/","read":true}
        ]
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let notifications = try decoder.decode([NotificationDataModel].self, from: jsonData)
            return notifications
        } catch {
            fatalError("Error creating mock instance of Notifications: \(error)")
        }
    }()
}
