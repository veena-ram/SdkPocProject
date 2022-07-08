//
//  AppDelegate.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import AWSDK

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var pushNotifications: PushNotifications = PushNotifications()
    var documentDlp: DocumentDLP = DocumentDLP()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let awcontroller = AWController.clientInstance()
        awcontroller.callbackScheme = "myCallbackScheme"
        awcontroller.delegate = self
        awcontroller.start()
        
        return true
    }

    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let token = deviceToken.map({String(format: "%02x", $0)}).joined()
        print("Device Token: \(token)")

    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for push notifications: \(error)")
    }
    
    
    func controllerDidReceive(enrollmentStatus: AWSDK.EnrollmentStatus) {
        print("Current Enrollment Status: \(String(describing: enrollmentStatus))")
    }
    
}


//DLP - PoC
//Third party keyboards
extension AppDelegate {

    func application(_ application: UIApplication,
                     shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        return false;
    }
}


//AWControllerDelegate Protocol
extension AppDelegate: AWControllerDelegate {
    
    func controllerDidFinishInitialCheck(error: NSError?) {
        print("Inside controllerDidFinishInitialCheck")
        if error != nil {
            AWLogError("Initial Check Done Error: \(String(describing: error)))")
        return
        }
        AWLogError("SDK Initial Check Done!")
        
        pushNotifications.registerForPushNotifications()

        print("Document download...")
        documentDlp.downloadPdf()
    }
    
}

