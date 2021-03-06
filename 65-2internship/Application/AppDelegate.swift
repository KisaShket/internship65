//
//  AppDelegate.swift
//  65-2internship
//
//  Created by Kisa Shket on 28.10.2020.
//  Copyright © 2020 Kisa Shket. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = LaunchStory().viewController
    window?.makeKeyAndVisible()
    return true
  }

  @available(iOS 9.0, *)
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {

    return GIDSignIn.sharedInstance()?.handle(url) ?? false
  }
}

