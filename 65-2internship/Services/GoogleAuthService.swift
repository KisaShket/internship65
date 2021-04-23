//
//  AuthService.swift
//  65-2internship
//
//  Created by Kisa Shket on 29.10.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import UIKit
import GoogleSignIn

/// Сервис по работе с авторизацией
protocol AuthService {
    /// AccessToken
    var accessToken: String { get }
    /// Тихая авторизация
    func signInSilently(complition: @escaping (Result<Void, Swift.Error>) -> Void)
    /// Авторизовать пользователя
    func signIn(viewController: UIViewController, complition: @escaping (Result<Void, Swift.Error>) -> Void)
    /// Выход
    func signOut(complition: @escaping ()-> Void)
}

final class GoogleAuthService: NSObject, AuthService {
        
    static let shared = GoogleAuthService()
    
    var accessToken: String {
        return GIDSignIn.sharedInstance()?.currentUser.authentication.accessToken ?? ""
    }
    
    private var isLoggedIn: ((Result<Void,Error>) -> Void)?
    
    private override init() {
        super.init()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.clientID = Constants.kGidId
    }
    
    // MARK: - AuthService
    
    func signIn(viewController: UIViewController, complition: @escaping (Result<Void, Error>) -> Void) {
        guard let shared = GIDSignIn.sharedInstance() else { return }
        shared.scopes = [Constants.kScope]
        shared.presentingViewController = viewController
        shared.signIn()
        isLoggedIn = complition
    }
    
    func signInSilently(complition: @escaping (Result<Void, Error>) -> Void) {
        guard let shared = GIDSignIn.sharedInstance() else { return }
        isLoggedIn = complition
        shared.delegate = self
        shared.restorePreviousSignIn()
    }
    
    func signOut(complition: @escaping () -> Void) {
        guard let shared = GIDSignIn.sharedInstance() else { return }
        shared.signOut()
        complition()
    }
}

extension GoogleAuthService: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard error == nil else {
            isLoggedIn?(.failure(error))
            return
        }
        
        guard user != nil else {
            return
        }
        isLoggedIn?(.success(()))
    }
}


