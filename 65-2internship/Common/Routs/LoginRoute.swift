//
//  LoginRoute.swift
//  65-2internship
//
//  Created by Kisa Shket on 23.04.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import Foundation
import Router
protocol LoginRoute {
    
  func showLoginStory()
}

extension LoginRoute where Self: RouterProtocol {

  func showLoginStory() {
    let transition = WindowCrossDissolve()
    open(LoginStory().viewController, transition: transition)
  }
}
