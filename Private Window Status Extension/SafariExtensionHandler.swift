//
//  SafariExtensionHandler.swift
//  Private Window Status Extension
//
//  Created by Christopher Weirup on 2020-05-04.
//  Copyright © 2020 Christopher Weirup. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
        page.getPropertiesWithCompletionHandler { properties in
//            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        NSLog("The extension's toolbar item was clicked")
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        //validationHandler(true, "")
        NSLog("Entered validateToolbarItem")
        
        window.getActiveTab{ (activeTab) in
            activeTab?.getActivePage{ (activePage) in
                activePage?.getPropertiesWithCompletionHandler{ (pageProperties) in
                    var image: NSImage
//                    NSLog("validateToolbarItem Private?: \(pageProperties!.usesPrivateBrowsing)")
                    guard let isPrivate = pageProperties?.usesPrivateBrowsing else {
                        validationHandler(false, "")
                        return
                    }
                    
                    switch isPrivate {
                    case true:
                        image = NSImage(named: "privateicon")!
                        validationHandler(true, "")
                    case false:
                        image = NSImage(named: "nonprivateicon")!
                        validationHandler(false, "")
                    }

//                    if (pageProperties!.usesPrivateBrowsing) {
//                        //image = NSImage(named: "privateicon")!
//                        validationHandler(true, "")
//                    }
//                    else {
//                        //image = NSImage(named: "nonprivateicon")!
//                        validationHandler(false, "")
//                    }
                    
                    window.getToolbarItem { (toolbarItem) in
                        toolbarItem?.setImage(image)
                    }
                }
            }
        }
    }
            
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}
