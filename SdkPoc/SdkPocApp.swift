//
//  SdkPocApp.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/6/22.
//

import SwiftUI
import AWSDK

@main
struct SdkPocApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .onOpenURL { (url) in
                    let sourceApplication = url.user
                    let handedBySDKController = AWController.clientInstance().handleOpenURL(
                        url, fromApplication: sourceApplication)
                    print("Handed over to AWController: \(handedBySDKController)")
                }
        }
    }
}
