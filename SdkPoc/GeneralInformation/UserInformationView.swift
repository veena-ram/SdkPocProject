//
//  UserInformationView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import SwiftUI

struct UserInformationView: View {
    
    //    @Binding var showNestedView: Bool
    
    var getUserInfo: GetUserInfo = GetUserInfo()
    
    var body : some View {
        List(getUserInfo.getUserInfoData()){ userInfo in
            Text("\(userInfo.key) : \(userInfo.value)").padding()
        }
    }
    
}

class GetUserInfo {
    
    init() {
        getUserInfo()
    }
    
    @Published var generalInformation : [GeneralInformation] = []
    
    func getUserInfoData() -> [GeneralInformation] {
        return self.generalInformation
    }
    
    func getUserInfo() {
        
        AWSDKHelper.shared.retrieveUserInfo { (userInformation, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let userInfo = userInformation {
                self.generalInformation.append(GeneralInformation(key: "Username", value: userInfo.userName))
                self.generalInformation.append(GeneralInformation(key: "Email", value: userInfo.email))
                self.generalInformation.append(GeneralInformation(key: "Full Name", value: userInfo.firstName + " " + userInfo.lastName))
                self.generalInformation.append(GeneralInformation(key: "Organization", value: userInfo.groupID))
                self.generalInformation.append(GeneralInformation(key: "Domain", value: userInfo.domain))
                self.generalInformation.append(GeneralInformation(key: "UserID", value: userInfo.userIdentifier))
            }
            
        }
    }
}

