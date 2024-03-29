//
//  HomeApiClient.swift
//  MODO-clone
//
//  Created by Julieta Ferraris on 1/10/24.
//

import Foundation

let NOTIFICATIONS_BASE_URL = "https://notifications-bff.preprod.playdigital.com.ar"

protocol HomeApiClientDelegate: AnyObject {
    func updateNotifications(notifications:[NotificationDataModel] )
    func updateUserDataModel(accounts: [UserDataModel.Account])
}

class HomeApiClient {
    weak var delegate: HomeApiClientDelegate?
    var accountsFinal: [UserDataModel.Account] = []
    
    func getNotifications(completion: @escaping () -> Void) {
        let endpointURL = "\(NOTIFICATIONS_BASE_URL)/notifications?limit=50"
        APIUtils.performRequest(urlString: endpointURL) { (result: Result<[NotificationDataModel], Error>) in
            switch result {
            case .success(let notificationsDataModel):
                self.delegate?.updateNotifications(notifications: notificationsDataModel)
            case .failure(let error):
                self.handleError(error)
            }
            completion()
        }
    }
    
    func getAccountsAmount(accounts: [UserDataModel.Account]) {
        let dispatchGroup = DispatchGroup()
        var accountsWithBalance = accounts
        
        var uniqueBankIDs = Set<String>([])
        for account in accounts {
            uniqueBankIDs.insert(account.bank.id)
        }
        let uniqueBankIDsArray = Array(uniqueBankIDs)
        
        uniqueBankIDsArray.forEach { bankId in
            dispatchGroup.enter()
            self.getAmount(bankId: bankId, accounts: accounts) { updatedAccounts in
                accountsWithBalance = updatedAccounts
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.delegate?.updateUserDataModel(accounts: accountsWithBalance)
        }
    }
    
    func getAmount(bankId: String, accounts: [UserDataModel.Account], completion: @escaping ([UserDataModel.Account]) -> Void) {
        let endpointURL = "\(API_BASE_URL)/banks/\(bankId)/accounts"
        
        APIUtils.performRequest(urlString: endpointURL) { (result: Result<[BankAccountDataModel], Error>) in
            switch result {
            case .success(let banksAccountsDataModel):
                let balanceById = Dictionary(uniqueKeysWithValues: banksAccountsDataModel.map { ($0.id, $0.balance) })
                
                accounts.forEach { userAccount in
                    var updatedUserAccount = userAccount
                    if let balance = balanceById[userAccount.id] {
                        updatedUserAccount.balance = balance
                        self.accountsFinal.append(updatedUserAccount)
                    }
                }
            case .failure(let error):
                print("Error del getAmount by bankId: ", error)
            }
            
            completion(self.accountsFinal)
        }
    }
    
    func handleError(_ error: Error) {
        print("Ocurrió un error!")
    }
}
