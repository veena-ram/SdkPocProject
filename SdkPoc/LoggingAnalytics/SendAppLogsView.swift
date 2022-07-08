//
//  SendAppLogs.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/16/22.
//

import Foundation
import SwiftUI
import AWSDK

struct SendAppLogsView : View {
    
    var sendAppLogs: SendAppLogs = SendAppLogs()

    var body: some View {
        Text("Status : \(sendAppLogs.getStatus())")
    }
}

class SendAppLogs {
    
    private var displayMessage: String = ""
    lazy private var controller = AWController.clientInstance()
    
    init() {
        sendAppLogs()
    }

    func sendAppLogs() {
        controller.sendLogDataWithCompletion { success, error in
            if success, error == nil {
                self.displayMessage = "Successfully sent app logs."
            } else {
                self.displayMessage = "Failed to send app logs."
            }
            
        }
    }
    
    func getStatus() -> String {
        return self.displayMessage
    }
}
