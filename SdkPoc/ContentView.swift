//
//  ContentView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var text: TextFile
        
    var body: some View {
                    
        NavigationView{
            HStack(){
                List{
                    NavigationLink("General Information", destination: GeneralInformationView())
                        .padding()
                    NavigationLink("Data Loss Prevention", destination: DataLossPreventionView())
                        .padding()
                    NavigationLink("Logging & Analytics", destination: LogAnalyticsView())
                        .padding()
                    NavigationLink("Authentication & Encryption", destination: HelloWorldView())
                        .padding()
                    NavigationLink("Testing", destination: HelloWorldView())
                        .padding()
                }
                
            }.navigationTitle("Veena - SDK PoC")
                .navigationBarTitleDisplayMode(.automatic)
                .padding()
        }
        
//        Button(action: {
//            self.dismiss?()
//        }) {
//            Text("Dismiss me")
//        }
//        Button(action: {
//            self.present?()
//        }) {
//            Text("Present some UIViewController")
//        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//CUSTOM TEXT SCREEN FOR DLP

//struct CustomTextField: View {
//
//    var placeholder: String
//    @Binding var text: String
//    var body: some View {
//        HStack {
//            TextField(placeholder,text: $text)
//        }.padding()
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(8)
//            .padding()
//
//    }
//}




//    @State var text: String = ""
//    @State var password: String = ""
//
//    var body: some View {
//        CustomTextField(placeholder: "username", text: $text)
//        CustomTextField(placeholder: "password", text: $password)
//
//        Link("Documentation", destination: URL(string: "https://developer.vmware.com/web/sdk/Native/airwatch-ios")!)
//    }
    

