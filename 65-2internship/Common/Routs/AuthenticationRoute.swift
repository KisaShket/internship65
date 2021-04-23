//
//  AuthenticationRoute.swift
//  65-2internship
//
//  Created by Kisa Shket on 11.02.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import Foundation
import Router

protocol AuthenticationRoute {
    func showAuthenticationStory(authService: AuthService, callback: @escaping (Result<Void,Swift.Error>) -> Void)
}

extension AuthenticationRoute where Self: RouterProtocol{
    func showAuthenticationStory(authService: AuthService, callback: @escaping (Result<Void,Swift.Error>) -> Void) {
        guard let viewController = viewController else { return }
        authService.signIn(viewController: viewController, complition: callback)
    }
}

