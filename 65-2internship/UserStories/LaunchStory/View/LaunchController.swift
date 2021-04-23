//
//  LaunchViewController.swift
//  65-2internship
//
//  Created by Kisa Shket on 23.04.2021.
//  Copyright © 2021 Kisa Shket. All rights reserved.
//

import UIKit
class LaunchController: UIViewController {
    
    var viewModel: LaunchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.chooseStartStory()
    }
}
