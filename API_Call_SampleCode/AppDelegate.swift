//
//  AppDelegate.swift
//  API_Call_SampleCode
//
//  Created by Aman on 07/06/23.
//

import Cocoa
import Alamofire

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 900
        configuration.timeoutIntervalForResource = 900
        return Session(configuration: configuration)
    }()


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

