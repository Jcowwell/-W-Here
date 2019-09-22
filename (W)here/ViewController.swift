//
//  ViewController.swift
//  (W)here
//
//  Created by Jevon Cowell on 9/21/19.
//  Copyright © 2019 Pace. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("A")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("b")
    }
    
    var session: WCSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
        
    }


}

