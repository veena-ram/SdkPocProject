//
//  GeneralInformationView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/13/22.
//

import Foundation
import SwiftUI

struct GeneralInformationView: View {
    //    @State var viewType: ViewType
        
    var body: some View {
        ZStack{
            Color
                .black.edgesIgnoringSafeArea(.all)
            ScrollView{
                NavigationLink("Device Information", destination: DeviceInformationView())
                    .padding()
                NavigationLink("User Information", destination: UserInformationView())
                    .padding()
                NavigationLink("Compromised Status Information", destination: CompromisedStatusView())
                    .padding()
            }
        }.navigationTitle("General information")
            .navigationBarTitleDisplayMode(.automatic)
            .padding()
        
    }
}

