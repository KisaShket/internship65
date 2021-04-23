//
//  LaunchStory.swift
//  65-2internship
//
//  Created by Kisa Shket on 23.04.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import UIKit

struct LaunchStory {
    
    let viewController: UIViewController
    
    init() {
        let storyboard = UIStoryboard(name: Constants.kLaunchStoryboardName, bundle: nil)
        let router = LaunchRouter()
        let viewModel = LaunchViewModel(router: router, authService: GoogleAuthService.shared)
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.kLaunchID) as! LaunchController
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}
