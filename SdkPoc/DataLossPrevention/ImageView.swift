//
//  ImageView.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/21/22.
//

import Foundation
import SwiftUI

struct ImageView : View {
    
    var body: some View {
                        
        let image = UIImage(named: "Image.png")
        let imageToShare = image!
        
        Image(uiImage: imageToShare)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

    }
    
}
