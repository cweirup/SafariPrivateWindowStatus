//
//  SafariExtensionViewController.swift
//  Private Window Status Extension
//
//  Created by Christopher Weirup on 2020-05-04.
//  Copyright © 2020 Christopher Weirup. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
