//
//  APIUtils.swift
//  MODO-clone
//
//  Created by Nahuel Lalin on 23/01/2024.
//

import Foundation

class APIUtils {
    
    static func performRequest<T: Decodable>(
        urlString: String,
        method: String? = "GET",
        body: Data? = nil,
        completion: @escaping (Result<T, Error>) -> Void,
        session: URLSession = URLSession.shared
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let headers = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "x-api-version": "9",
            "x-app-version": "1.78.0",
            "x-app-build-number": "1078000",
            "x-fingerprint": FINGERPRINT,
            "authorization": APIClient.accessToken
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = method ?? "GET"
        request.httpBody = body
        
        
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            do {
                if let data = data {
                    
                    // Data print
//                    if let dataString = String(data: data, encoding: .utf8) {
//                        print("Data received: \(dataString)")
//                    } else {
//                        print("Unable to convert data to string for printing.")
//                    }
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
