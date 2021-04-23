//
//  ViewController.swift
//  65-2internship
//
//  Created by Kisa Shket on 28.10.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

  var viewModel: LoginViewModel?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func clickedLoginButton(_ sender: Any) {
    viewModel?.signIn(vc: self)
  }
}


