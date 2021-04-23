//
//  LoginViewModel.swift
//  65-2internship
//
//  Created by Vladimir Shutov on 26.01.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import UIKit

final class LoginViewModel {
    
    private let router: LoginRouter
    private let authService: AuthService
    
    init(router: LoginRouter, authService: AuthService) {
        self.router = router
        self.authService = authService
    }
    
    func signIn(vc: UIViewController) {
        
        authService.signInSilently { [self] result in
            switch result {
            
            case .success():
                router.showContactsStory()
            case .failure(_):
                router.showAuthenticationStory(authService: authService) { [router] result  in
                    switch result {
                    case .success():
                        router.showContactsStory()
                    case .failure(let error):
                        router.show(title: "Error",
                                    message: error.localizedDescription,
                                    actions: [("Ok", nil)],
                                    animated: true,
                                    completion: {})
                    }
                }
            }
        }
    }
}

