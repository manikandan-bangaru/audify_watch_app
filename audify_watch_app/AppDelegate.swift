//
//  AppDelegate.swift
//  audify_watch_app
//
//  Created by manikandan bangaru on 26/07/21.
//

import UIKit
import WatchConnectivity
@main
class AppDelegate: UIResponder, UIApplicationDelegate ,WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WC Sesson \(activationState)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("Message arrived")
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("Message arrived")
        if let msg = message["command"] as? String{
            
            var title = "No Message"
            switch msg {
                
            case "goBack" :
                title = "back"
                print("Go back")
            case "goForward":
                title = "goForward"
                print("Go forward")
            case "pause":
                title = "Pause"
                print("pause")
            default:
                print(msg)
            }
            
            let alertVC = UIAlertController(title: title, message: "", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            let rootVC = UIApplication.shared.keyWindow?.rootViewController
            rootVC?.present(alertVC, animated: true, completion: nil)
        }
        replyHandler(message)
    }
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let wcsession =  WCSession.default
        wcsession.delegate = self
        wcsession.activate()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

