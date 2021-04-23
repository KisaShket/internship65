//
//  ContactTableViewModelFromEntry.swift
//  65-2internship
//
//  Created by Kisa Shket on 05.11.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import Foundation
import SDWebImage

protocol ContactTableViewModel {
    var dynamicContact: Dynamic<[ContactsData]> { get }
    
    func fetchContacts()
    func signOut()
}

class ContactTableViewModelFromEntry: ContactTableViewModel {
    
    var dynamicContact: Dynamic<[ContactsData]> = Dynamic([])
    
    private let authService : AuthService
    private let networkService : Networker
    private let router : ContactRouter
    
    init(networkService: Networker, authService: AuthService, router: ContactRouter) {
        self.authService = authService
        self.networkService = networkService
        self.router = router
    }
    
    func fetchContacts() {
        let token = authService.accessToken

        networkService.fetchContacts { [weak self] contacts in
            let entries = contacts?.feed?.entry
            guard let contacts = entries?.filter({type in type.profileType == "profile"}) else {
                return
            }
            let contactsData = contacts.map { cont in
                ContactsData(
                    fullName: cont.fullName,
                    eMail: cont.gdEmail?.first?.address,
                    phoneNumber: cont.gdPhoneNumber?.first?.phoneNumber ?? "Телефон отсутствует.",
                    imgUrl: URL(string: (cont.link?.first?.href)!+"?access_token=\(token)")
                )
            }
            self?.dynamicContact.value = contactsData
        }
    }
    
    func signOut(){
        authService.signOut { [weak self] in
            self?.router.showLoginStory()
        }
    }
}
