////
////  DocumentDLP.swift
////  SdkPoc
////
////  Created by Veena Ram on 6/10/22.
////

import Foundation
import Alamofire
import UIKit


class DocumentDLP {
    
    var name : String?
        
    let filePath = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")
    let mimeType = "application/pdf"
    let fileName = "SampleFile"
    
    init() {}
    
    
    func fileUpload(fileData: Data, fileName: String, mimeType: String) {
        
        guard let url = URL(string: Bundle.main.bundleURL.absoluteString) else {
            return
        }
        AF.upload(multipartFormData: { multipart in
            multipart.append(fileData, withName: "upload_file[]", fileName: fileName, mimeType: mimeType)
        }, to: url, method: .post)
        .uploadProgress(closure: { progress in
            print(progress.fractionCompleted * 100)
        })
        .response { response in
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "")
            } else {
                print("Failed to upload")
            }
        }
        
    }
    
    func downloadPdf() {
        let url = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")!
        let destination = DownloadRequest.suggestedDownloadDestination(for: .downloadsDirectory)
        
        AF.download(
            url,
            method: .get,
            encoding: JSONEncoding.default,
            headers: nil,
            to: destination).downloadProgress(closure: { (progress) in
                let progressLabel: String = (String)(progress.fractionCompleted)
                print("Progress: \(progressLabel)")
            }).response(completionHandler: { response in
                print("Download URL : \(String(describing: response.fileURL))")
            })
        
    }
    

    func anyFunc(error: String) {

    }


}
