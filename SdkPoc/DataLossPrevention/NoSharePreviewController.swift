//
//  DocumentInteractionView3.swift
//  SdkPoc
//
//  Created by Veena Ram on 6/22/22.
//

import Foundation
import QuickLook
import SwiftUI

final class NoSharePreviewController: QLPreviewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationController?.setToolbarHidden(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItems = []
    }
}
