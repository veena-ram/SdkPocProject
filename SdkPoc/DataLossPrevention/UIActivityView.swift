//
//  DocumentInteractionView2.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/21/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct UIActivityView : View {
    
    var checkingMimeType: CheckingMimeType = CheckingMimeType()
    @State private var isSharePresented: Bool = false
    
    var body: some View {
        Button("Preview PDF") {
            self.isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented,
               onDismiss: {
            print("Dismiss")
        }, content: {
            ActivityViewController(
                activityItems: [Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")!]
            )
        })
        
        Text("Checking mime Type: \(checkingMimeType.getMimeType())")

    }
}

struct ActivityViewController : UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities : [UIActivity]? = nil
    @Environment(\.presentationMode) var presentationMode

    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: applicationActivities)
        
        controller.excludedActivityTypes = [UIActivity.ActivityType.airDrop]
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            self.presentationMode.wrappedValue.dismiss()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

class CheckingMimeType {
    
    func getMimeType() -> String {
        let fileUrl = Bundle.main.url(forResource: "hello", withExtension: "js")!
        print("Checking mime type...")
        print(fileUrl.contains(.image))
        print(fileUrl.contains(.video))
        print(fileUrl.contains(.text))
        print(fileUrl.contains(.pdf))
        
        if(fileUrl.contains(.javaScript)) {
            return "\(fileUrl.mimeType) : Checked"
        } else {
            return "\(fileUrl.mimeType) : Not checked"
        }

    }
    
}

extension URL {
    
    var mimeType: String {
            return UTType(filenameExtension: self.pathExtension)?.preferredMIMEType ?? "application/octet-stream"
        }
        
        func contains(_ uttype: UTType) -> Bool {
            return UTType(mimeType: self.mimeType)?.conforms(to: uttype) ?? false
        }
}
