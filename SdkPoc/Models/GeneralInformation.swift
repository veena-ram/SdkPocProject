//
//  GeneralInformation.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation

struct GeneralInformation: Identifiable {
    var id: String {
        return key
    }
    
    let key: String
    let value: String
}

enum ViewType {
    case device
    case user
}
