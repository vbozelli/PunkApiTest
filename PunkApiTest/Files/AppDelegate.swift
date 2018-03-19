//
//  AppDelegate.swift
//  PunkApiTest
//
//  Created by Victor Bozelli Alvarez on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        NetworkActivityIndicatorManager.shared.isEnabled = true
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
