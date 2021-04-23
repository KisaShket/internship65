
//
//  ContactTableViewController.swift
//  65-2internship
//
//  Created by Kisa Shket on 29.10.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import UIKit
import SDWebImage

class ContactTableViewController: UITableViewController {
    
    var viewModel: ContactTableViewModel?
    var contacts: [ContactsData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.dynamicContact.bind { [weak self] contacts in
            self?.contacts = contacts
        }
        viewModel?.fetchContacts()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Контакты 65apps"
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let cell = tableCell as! ContactTableViewCell
        let contact = contacts[indexPath.row]
        cell.configureCell(withContactModel: contact)
        return cell
        
    }

    @IBAction func signOut(_ sender: Any) {
        viewModel?.signOut()
    }
}
