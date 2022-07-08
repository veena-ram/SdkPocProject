//
//  DataLossPrevention.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import SwiftUI
import AWSDK

struct DataLossPreventionView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var uiText: UITextField!
    
    var body : some View {
                
        VStack {
            Text("Testing Copy-Paste")
            TextField("username", text: $username)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding()
            TextField("password", text: $password)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding()
            
        }.padding()
        
        VStack {
            
            SecureField("Testing", text: $username)
            
            Text("Testing HTTPS link redirection")
                .padding()
            Link("Documentation", destination: URL(string: "https://developer.vmware.com/web/sdk/Native/airwatch-ios")!)
                .padding()
            
        }.padding()
        
        VStack {
            
            
            Text("Document and Image Links")
                .padding()
            NavigationLink("Preview Document", destination: DocumentInteractionView())
                .padding()
            
            NavigationLink("Preview Image", destination: ImageView())
                .padding()
            
        }.padding()
    }
}

class CopyPaste {
    var uiText: String = "Checking UITextField"
    
    func print(string: String) -> String {
        return self.uiText
    }
}
