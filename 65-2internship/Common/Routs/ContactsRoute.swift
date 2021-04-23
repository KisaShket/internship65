//
//  ContactsRoute.swift
//  65-2internship
//
//  Created by Vladimir Shutov on 26.01.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import UIKit
import Router

protocol ContactsRoute {
    
  func showContactsStory()
}

extension ContactsRoute where Self: RouterProtocol {

  func showContactsStory() {
    let transition = WindowCrossDissolve()
    open(ContactsStory().viewController, transition: transition)
  }

}
