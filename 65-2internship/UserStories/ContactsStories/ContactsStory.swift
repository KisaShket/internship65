//
//  ContactsStory.swift
//  65-2internship
//
//  Created by Kisa Shket on 31.01.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//
import UIKit
struct ContactsStory {
    
    let viewController: UIViewController
    let contactsVCIdentifier = "contacts"
    
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let networkService = Networker()
        let router = ContactRouter()
        let viewModel = ContactTableViewModelFromEntry(networkService: networkService, authService: GoogleAuthService.shared, router: router)
        let viewController = storyboard.instantiateViewController(withIdentifier: contactsVCIdentifier) as! ContactTableViewController
        viewController.viewModel = viewModel
        self.viewController = UINavigationController(rootViewController: viewController)
    }
    
}
