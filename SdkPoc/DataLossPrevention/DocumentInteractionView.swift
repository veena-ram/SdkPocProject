//
//  DocumentInteractionView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/16/22.
//

import Foundation
import SwiftUI
import QuickLook

struct DocumentInteractionView: View {
    
    let fileUrl = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")!
    
    @State private var showingPreview = false
    
    var body: some View {
        Button("Preview File") {
            self.showingPreview = true
        }
        .sheet(isPresented: $showingPreview) {
            PreviewController(
                url: self.fileUrl,
                isPresented: self.$showingPreview
            )
        }
    }
}

struct PreviewController: UIViewControllerRepresentable {
    let url: URL
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let controller = NoSharePreviewController()
        controller.dataSource = context.coordinator
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done, target: context.coordinator,
            action: #selector(context.coordinator.dismiss)
        )
        
//        controller.setToolbarItems(nil, animated: true)
//
//        controller.navigationItem.rightBarButtonItem = UIBarButtonItem()
//        controller.navigationItem.rightBarButtonItems = []
        
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController,context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: QLPreviewControllerDataSource {
        let parent: PreviewController
        
        init(parent: PreviewController) {
            self.parent = parent
        }
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return parent.url as NSURL
        }
        
        @objc func dismiss() {
            parent.isPresented = false
        }
    }
}
