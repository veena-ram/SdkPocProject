//
//  CompromisedStatusView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/16/22.
//

import Foundation
import AWSDK
import SwiftUI

struct CompromisedStatusView : View {
    
    var deviceStatus: DeviceCompromisedStatus = DeviceCompromisedStatus()
    
    var body: some View {
        Text("Status : \(deviceStatus.getStatus())")
    }
}

class DeviceCompromisedStatus {
    
    private var status: String = ""
    
    init() {
        getCompromisedStatus()
    }
    
    func getCompromisedStatus() {
        AWSDKHelper.shared.checkCompromisedStatus { isJailbroken, evaluationToken, identifier in
            if isJailbroken {
                self.status = "Device is compromised"
            }
            else {
                self.status = "Device is not compromised"
            }
        }
    }
    
    func getStatus() -> String {
        return status
    }
}
