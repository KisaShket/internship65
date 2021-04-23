//
//  LoginStory.swift
//  65-2internship
//
//  Created by Vladimir Shutov on 26.01.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import UIKit

struct LoginStory {
  let viewController: UIViewController
  let loginVCIdentifier = "login"

  init() {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let router = LoginRouter()
    let viewModel = LoginViewModel(router: router, authService: GoogleAuthService.shared)
    let viewController = storyBoard
      .instantiateViewController(withIdentifier: loginVCIdentifier) as! LoginController
    router.viewController = viewController
    viewController.viewModel = viewModel
    self.viewController = viewController
  }
}
