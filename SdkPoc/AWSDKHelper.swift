//
//  AWSDKHelper.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/8/22.
//

import Foundation
import AWSDK

internal class AWSDKHelper {
    
    static let shared: AWSDKHelper = .init()
    lazy private var controller = AWController.clientInstance()
    
    private init() { }
    
}

extension AWSDKHelper {
    internal func queryDeviceEnrollmentStatus(completion : @escaping (Bool, NSError?) -> Void) {
        controller.queryDeviceEnrollmentStatus(completion)
    }
    
    internal  func fetchApplicationAssignmentStatus(completion: @escaping (AWSDK.ApplicationStatusInformation?, AWSDK.SharedDeviceInformation?, Error?) -> Void){
        DeviceInformationController.sharedController.fetchApplicationAssignmentStatus(completion: completion)
    }
    
    internal  func retrieveUserInfo(completion: @escaping (UserInformation?, NSError?) -> Void){
        UserInformationController.sharedInstance.retrieveUserInfo(completionHandler: completion)
    }
}

extension AWSDKHelper {
    internal func checkCompromisedStatus(completion: @escaping (_ isJailbroken: Bool, _ evaluationToken: String, _ identifier: String?) -> Void){
        DeviceInformationController.sharedController.refreshDeviceCompromisedStatus(completion: completion)
    }
}
