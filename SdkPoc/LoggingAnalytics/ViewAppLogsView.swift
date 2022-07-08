//
//  ViewAppLogsView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/16/22.
//

import Foundation
import SwiftUI
import AWSDK

struct ViewAppLogsView: View {
    var fetchLogs: FetchLogs = FetchLogs()
    var body : some View {
        ScrollView {
            Text(fetchLogs.getLogs())
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(100)
                .padding()
        }
        
    }
}
class FetchLogs {
    
    var logs: String = ""
    
    init() {
        do {
            let logsData = try getLogsFromSdk()
            logs = String(decoding: logsData!, as: UTF8.self)
        } catch {
            print("Error fetching logs.")
        }
    }
    
    func getLogsFromSdk() throws -> Data? {
        let logProvider = WS1SDKDataProvider()
        let log = try logProvider.fetchSDKLogData()
        return log
    }
    
    func getLogs() -> String {
        return self.logs
    }
}
