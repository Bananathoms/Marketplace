//
//  MarketplaceApp.swift
//  Marketplace
//
//  Created by CESI on 03/11/2022.
//

import SwiftUI
import IQKeyboardManagerSwift
import ParseSwift

@main
struct MarketplaceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared.enable = true
        
        ParseSwift.initialize(applicationId: ParseConfig.applicationID, clientKey: ParseConfig.clientKey, serverURL: URL(string: ParseConfig.serverURL)!)
        
      return true
    }
}
