//
//  LaunchViewModel.swift
//  65-2internship
//
//  Created by Kisa Shket on 23.04.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import Foundation

final class LaunchViewModel {
    
    private let router: LaunchRouter
    private let authService: AuthService
    
    init(router: LaunchRouter, authService: AuthService) {
        self.router = router
        self.authService = authService
    }
    
    func chooseStartStory(){
        authService.signInSilently { [router] result in
            switch result {
            case .success():
                router.showContactsStory()
            case .failure(_):
                router.showLoginStory()
            }
        }
    }
}
