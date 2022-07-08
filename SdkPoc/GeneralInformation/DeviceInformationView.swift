//
//  DeviceInformationView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import SwiftUI
import AWSDK

struct DeviceInformationView: View {
    
    //    @Binding var showNestedView: Bool
    
    var getDeviceInfo: GetDeviceInfo = GetDeviceInfo()
    
    var body : some View {
        List(getDeviceInfo.getDeviceInfoData()){ deviceInfo in
            Text("\(deviceInfo.key) : \(deviceInfo.value)").padding()
        }
    }
    
}

class GetDeviceInfo {
    
    init() {
        getDeviceInfo()
    }
    
    @Published var generalInformation : [GeneralInformation] = []
    
    func getDeviceInfoData() -> [GeneralInformation] {
        return self.generalInformation
    }
    
    func getDeviceInfo() {
        
        AWSDKHelper.shared.fetchApplicationAssignmentStatus {(applicationStatusInformation: ApplicationStatusInformation?,
                                                              sharedDeviceInformation: SharedDeviceInformation?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let sharedInfo = sharedDeviceInformation {
                var deviceSharedStatus: String
                let sharedDevice: String = String(describing: sharedInfo.sharedDeviceStatus.rawValue)
                
                switch sharedDevice {
                case "0" : deviceSharedStatus = "Unknown"
                case "1" : deviceSharedStatus = "Shared device"
                default : deviceSharedStatus = "Not found"
                }
                
                self.generalInformation.append(GeneralInformation(key: "Is shared device", value: deviceSharedStatus))
                //print("Is shared device: \(sharedDevice)")
            }
            
            if let appStatusInfo = applicationStatusInformation {
                let appIsEnrolled: String = String(describing: appStatusInfo.enrollmentStatus)
                self.generalInformation.append(GeneralInformation(key: "Enrollment Status", value: appIsEnrolled))
                //print("App Enrolled : \(appIsEnrolled)")
            }
        }
    }
}
