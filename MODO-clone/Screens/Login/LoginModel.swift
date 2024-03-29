//
//  LoginMode;l.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 11/01/2024.
//

import Foundation

// MARK: LoginCredentials
struct LoginCredentials {
    let dni: String
    let email: String
    let phoneNumber: String
    let gender: String
    let password: String
    let loginType: String
    
    func toDictionary() -> [String: String] {
        return [
            "dni": dni,
            "email": email,
            "phone_number": phoneNumber,
            "gender": gender,
            "password": password,
            "login_type": loginType
        ]
    }
}

// MARK: LoginDataModel
struct LoginDataModel: Decodable {
    let access_token: String
}

// MARK: UserDataModel
struct UserDataModel: Decodable {
    let id: String
    let name: String
    let first_name: String
    let last_name: String
    let created_at: String
    let phone_number: String
    let dni: String
    var accounts: [Account]
    let cards: [Card]
    let email_validated: Bool
    let email: String
    let gender: String
    let identity_validation: Bool
    let receive_benefits: Bool
    let member_get_members_amount: String
    let member_get_members_max_amount: String
    let member_get_members_url: String
    let suggested_banks: [Bank]
    let suggested_banks_by_cards: [Bank]
    let license_plates: [String]
    let image: String?
    
    struct Account: Decodable {
        let id: String
        let last_digits: String
        let type: String
        let currency_code: String
        let favourite: Bool
        let bank: Bank
        let schema: String
        let createdAt: String
        var balance: Float?
    }
    
    struct Card: Decodable {
        let id: String
        let issuer_name: String
        let favourite: Bool
        let expiry: String
        let type: String
        let bin: String
        let last_digits: String
        let expired: Bool
        let bank: Bank?
        let color: String?
        let card_color: String
        let bank_logo: String
        let issuer_logo: String
        let issuer_background_logo: String
        let recently_pushed: Bool
        let enrollment_type: String
        let details_available: Bool
        let cvv_type: String
        let prepaid: Bool?
        let card_art: CardArt
    }
    
    struct Bank: Decodable {
        let id: String
        let name: String
        let image_url: String
        let can_link: Bool?
        let automatic_card_linking: Bool?
        let favourite: Bool?
    }
    
    struct CardArt: Decodable {
        let active: Bool
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, first_name, last_name, created_at, phone_number, dni, accounts, cards, email_validated, email, gender, identity_validation, receive_benefits, member_get_members_amount, member_get_members_max_amount, member_get_members_url, suggested_banks, suggested_banks_by_cards, license_plates, image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        first_name = try container.decode(String.self, forKey: .first_name)
        last_name = try container.decode(String.self, forKey: .last_name)
        created_at = try container.decode(String.self, forKey: .created_at)
        phone_number = try container.decode(String.self, forKey: .phone_number)
        dni = try container.decode(String.self, forKey: .dni)
        accounts = try container.decode([Account].self, forKey: .accounts)
        cards = try container.decode([Card].self, forKey: .cards)
        email_validated = try container.decode(Bool.self, forKey: .email_validated)
        email = try container.decode(String.self, forKey: .email)
        gender = try container.decode(String.self, forKey: .gender)
        identity_validation = try container.decode(Bool.self, forKey: .identity_validation)
        receive_benefits = try container.decode(Bool.self, forKey: .receive_benefits)
        member_get_members_amount = try container.decode(String.self, forKey: .member_get_members_amount)
        member_get_members_max_amount = try container.decode(String.self, forKey: .member_get_members_max_amount)
        member_get_members_url = try container.decode(String.self, forKey: .member_get_members_url)
        suggested_banks = try container.decode([Bank].self, forKey: .suggested_banks)
        suggested_banks_by_cards = try container.decode([Bank].self, forKey: .suggested_banks_by_cards)
        license_plates = try container.decode([String].self, forKey: .license_plates)
        image = try container.decodeIfPresent(String.self, forKey: .image)
    }
}

extension UserDataModel.Account: Equatable {
    static func == (lhs: UserDataModel.Account, rhs: UserDataModel.Account) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: FeedDataModel
struct FeedDataModel: Decodable {
    let id: String
    let timestamp: String
    let status: String
    let type: String
    let subtype: String
    let category: String
    let feed_data: FeedData
    let amount: Float
    let image: String
    
    struct FeedData: Decodable {
        let event_type: String
        let event_date: String
        let payment: PaymentFeed
        let category: String
        let user: FeedUser
        let card: FeedCard?
    }
    
    struct PaymentFeed: Decodable {
        let payment_method_type: String
        let amount: Float
        let created_at: String
        let merchant_name: String
        let operation_date: String
        let installments_amount: Int?
        let additional_info: AdditionalInfo?
        let installments: String?
        let id: String
        let status: String
    }
    
    struct AdditionalInfo: Decodable {
        let paymentInstallments: PaymentInstallments?
    }
    
    struct PaymentInstallments: Decodable {
        let realQuantity: Int
        let amount: Float
        let quantity: Int
    }
    
    struct FeedUser: Decodable {
        let lastName: String
        let createdAt: String
        let type: String
        let failedLoginAttempts: Int
        let identityValidation: Bool
        let phoneNumber: String
        let id: String
        let firstName: String
        let identityConfidence: Int
        let dni: String
        let status: String
        
        enum CodingKeys: String, CodingKey {
            case lastName = "last_name"
            case createdAt = "created_at"
            case type
            case failedLoginAttempts = "failed_login_attempts"
            case identityValidation = "identity_validation"
            case phoneNumber = "phone_number"
            case id
            case firstName = "first_name"
            case identityConfidence = "identity_confidence"
            case dni
            case status
        }
    }
    
    struct FeedCard: Decodable {
        let bin: String
        let created_at: String
        let source: String
        let type: String
        let favourite: Bool?
        let last_digits: String
        let issuer_name: String
        let bank: Bank
        let updated_at: String
        let user_id: String
        let bank_id: String
        let id: String
        let expiry: String
    }
    
    struct Bank: Decodable {
        let bcra_description: String
        let image_url: String
        let feature_flags: FeatureFlags
        let name: String
        let card_color: String
        let id: String
        let bcra_id: Int
        let status: String
        let partnered: Bool
    }
    
    struct FeatureFlags: Decodable {
        let transferWithFingerprint: Bool
        let validateCard: Bool
        let flowFeatureFlags: FlowFeatureFlags?
        let mtls: Bool
        let loginNotification: Bool
    }
    
    struct FlowFeatureFlags: Decodable {
        let destinationAccountType: DestinationAccountType?
        
        enum CodingKeys: String, CodingKey {
            case destinationAccountType = "destinationAccountType"
        }
    }
    
    struct DestinationAccountType: Decodable {
        let virtual: Bool
    }
    
}

// MARK: PromosDataModel
struct PromosDataModel: Decodable {
    let cards: [PromosCards]
    
    struct PromosCards: Decodable {
        let id: String
        let cta_value: String
        let content: PromosContent
        
        struct PromosContent: Decodable {
            let image: PromosImage
            
            struct PromosImage: Decodable {
                let optional_images_pack: PromosImagePack
                
                struct PromosImagePack: Decodable {
                    let landscape_app: String
                }
            }
        }
    }
}

// MARK: BankAccountDataModel
struct BankAccountDataModel: Decodable {
    let id: String
    let balance: Float
}
