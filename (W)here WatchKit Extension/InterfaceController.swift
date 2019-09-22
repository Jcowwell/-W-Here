//
//  InterfaceController.swift
//  (W)here WatchKit Extension
//
//  Created by Jevon Cowell on 9/21/19.
//  Copyright © 2019 Pace. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import CoreLocation
import MapKit


class InterfaceController: WKInterfaceController, WCSessionDelegate, CLLocationManagerDelegate {
    
    
    var manager: CLLocationManager?
    var session:WCSession?
    var x = 0.0
    
    @IBAction func StopLocation() {
        manager?.allowsBackgroundLocationUpdates = false
        
    }
    
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("Here")
    }
    
    override func awake(withContext context: Any?) {
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            self.session = session
            print(self.session!)
            print("activated")
        }
       
        
        
        
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        /*
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        switch authorizationStatus {
        case .notDetermined:
                manager = CLLocationManager()
                manager!.delegate = self
                manager!.requestWhenInUseAuthorization()
                manager?.requestLocation()
                manager?.allowsBackgroundLocationUpdates = true
                print("Not Determined")

        case .authorizedWhenInUse:
                print("In Use")
            
        case .denied:
                print("Denied")
            
            default:
                break
        }
        */
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func Reachability() {
        if session!.isReachable {
            session!.sendMessage(["ACK" : "ACK"], replyHandler: { (response) in
                print("Reply: \(response)")
            }, errorHandler: { (error) in
                print("Error sending message: %@", error)
            })
        } else {
            print("iPhone is not reachable!!")
        }
    }

}
