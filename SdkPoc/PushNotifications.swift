//
//  PushNotification.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import UserNotifications
import SwiftUI

class PushNotifications {
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
          .requestAuthorization(
            options: [.alert, .sound, .badge]) { [weak self] granted, _ in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
          }
    }

    
    func getNotificationSettings() {
        UNUserNotificationCenter.current()
            .getNotificationSettings{settings in
                guard settings.authorizationStatus == .authorized else { return }
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
    }
    
}
