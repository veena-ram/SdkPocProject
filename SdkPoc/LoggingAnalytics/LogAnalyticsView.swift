//
//  LogView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/16/22.
//
//
import Foundation
import SwiftUI
import AWSDK

struct LogAnalyticsView: View {
    
    var body : some View {
        List {
            NavigationLink("View Logs", destination: ViewAppLogsView())
            NavigationLink("Send App Logs", destination: SendAppLogsView())
            NavigationLink("Append to Logs", destination: HelloWorldView())
        }
    }
}
