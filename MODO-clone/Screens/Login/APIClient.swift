//
//  APIClient.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 05/01/2024.
//

import Foundation

let API_BASE_URL = "https://api.preprod.playdigital.com.ar"
let FEED_API_BASE_URL = "https://feedapi.preprod.playdigital.com.ar"

protocol APICLientDelegate: AnyObject {
    func handleError(_ error: Error)
    func handleLoginError()
    func updateUserModel(user: UserDataModel)
    func updateFeedModel(feedData: [FeedDataModel])
    func updatePromosModel(promosData: PromosDataModel)
}

class APIClient {
    weak var delegate: APICLientDelegate?
    static var accessToken: String = ""
    private var accounts: [UserDataModel.Account] = []
    private var userDataModel: UserDataModel?
    
    func login(loginCredentials: LoginCredentials, completion: @escaping () -> Void) {
        let endpointURL = "\(API_BASE_URL)/auth/login"
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: loginCredentials.toDictionary()) else {
            print("Error al convertir datos a JSON")
            exit(1)
        }
        
        APIUtils.performRequest(urlString: endpointURL, method: "POST", body: jsonData) { (result: Result<LoginDataModel, Error>) in
            switch result {
            case .success(let dataModel):
                APIClient.accessToken = dataModel.access_token
            case .failure(let error):
                print("\n\n error del login: ", error)
                self.handleLoginError()
            }
            completion()
        }
    }
    
    func getUserInfo(completion: @escaping () -> Void) {
        let endpointURL = "\(API_BASE_URL)/users/me"
        APIUtils.performRequest(urlString: endpointURL) { (result: Result<UserDataModel, Error>) in
            switch result {
            case .success(let userDataModel):
                self.userDataModel = userDataModel
                self.accounts = userDataModel.accounts
                self.delegate?.updateUserModel(user: userDataModel)
            case .failure(let error):
                self.handleError(error)
            }
            completion()
        }
    }
    
    func getUserFeed(completion: @escaping () -> Void) {
        let endpointURL = "\(FEED_API_BASE_URL)/feed?limit=5"
        APIUtils.performRequest(urlString: endpointURL) { (result: Result<[FeedDataModel], Error>) in
            switch result {
            case .success(let feedDataModel):
                self.delegate?.updateFeedModel(feedData: feedDataModel)
            case .failure(let error):
                self.handleError(error)
            }
            completion()
        }
    }
    
    func getHomePromos(completion: @escaping () -> Void) {
        let endpointURL = "\(API_BASE_URL)/slot/app-modo-home-carrousel_principal"
        APIUtils.performRequest(urlString: endpointURL) { (result: Result<PromosDataModel, Error>) in
            switch result {
            case .success(let promosDataModel):
                self.delegate?.updatePromosModel(promosData: promosDataModel)
            case .failure(let error):
                self.handleError(error)
            }
            completion()
        }
    }
    
    func makeLogin(loginCredentials: LoginCredentials, completion: @escaping () -> Void) {
        self.getUserInfo {
            self.getUserFeed {
                self.getHomePromos {
                    completion()
                }
            }
        }
    }
    
    func checkLoginCredentials(loginCredentials: LoginCredentials, completion: @escaping () -> Void) {
        login(loginCredentials: loginCredentials) {
            completion()
        }
    }
    
    func handleError(_ error: Error) {
        delegate?.handleError(error)
    }
    
    func handleLoginError() {
        delegate?.handleLoginError()
    }
    
}
