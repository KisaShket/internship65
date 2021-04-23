//
//  Networker.swift
//  65-2internship
//
//  Created by Kisa Shket on 01.11.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import Foundation
import GoogleSignIn

class Networker {
    private let service = GoogleAuthService.shared
    private let urlComponents = URLComponents()
    private var contactsURL: URL?
    private let acceptableCodes = [200, 201, 202, 203, 304]
    
    
    //MARK: Private Func
    private func request(completion: @escaping (Result<Data,NetworkError>)->()) {
        guard let url = createUrl(withAccessToken: service.accessToken) else {
            
            completion(.failure(.noUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error{
                    completion(.failure(.unableToComplete))
                    return
                }
                
                if let response = response as? HTTPURLResponse,
                   self.acceptableCodes.contains(response.statusCode) == false {
                    completion(.failure(.wrongRequest(statusCode: response.statusCode)))
                }
                
                guard let data = data else {
                    completion(.failure(.wrongData))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
    
    private func createUrl(withAccessToken accessToken: String) -> URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.google.com"
        components.path = "/m8/feeds/gal/65apps.com/full"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: accessToken),
            URLQueryItem(name: "alt", value: "json")
        ]
        return components.url
    }
    
//MARK: Public Func
    func fetchContacts(response: @escaping (ContactsModel?) -> ()) {
        request() { result in
            switch result {
            case .success(let data):
                do{
                    let contacts = try JSONDecoder()
                        .decode(ContactsModel.self, from: data)
                    response(contacts)
                    print("Fetched")
                    
                }catch let jsonError{
                    print("Decode failed:", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil)
            }
        }
    }
}
