//
//  ViewController.swift
//  audify_watch_app
//
//  Created by manikandan bangaru on 26/07/21.
//

import UIKit
import WatchConnectivity

public enum Commands{
    case goBack
    case goForward
    case pause
}
class ViewController: UIViewController {
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        print("WC Sesson \(activationState)")
//    }
//
//    func sessionDidBecomeInactive(_ session: WCSession) {
//
//    }
//
//    func sessionDidDeactivate(_ session: WCSession) {
//
//    }
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        print("Message arrived")
//    }
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//        print("Message arrived")
//        if let msg = message["command"] as? String{
//
//            var title = "No Message"
//            switch msg {
//
//            case "goBack" :
//                title = "back"
//                print("Go back")
//            case "goForward":
//                title = "goForward"
//                print("Go forward")
//            case "pause":
//                title = "Pause"
//                print("pause")
//            default:
//                print(msg)
//            }
//
//            let alertVC = UIAlertController(title: title, message: "", preferredStyle: .alert)
//            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            let rootVC = UIApplication.shared.keyWindow?.rootViewController
//            rootVC?.present(alertVC, animated: true, completion: nil)
//        }
//        replyHandler(message)
//    }
    

    @IBOutlet weak var songNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initWCSession()
    }
    
    func initWCSession(){
       
        
        let wcsession =  WCSession.default
//        wcsession.delegate = self
//        wcsession.activate()
        guard wcsession.isReachable else{
            return
        }
        do{
        try wcsession.updateApplicationContext(["data" : ["Songs 1" , "Songs 2"]])
        }catch{
            
        }
        if  wcsession.isPaired {
            print("Iphone paired")
        }else{
            print("Iphone not paired")
        }
        
       
        if  wcsession.isWatchAppInstalled {
            print("watch  installed")
        }else{
            print("watch app  not installed")
        }
       
        
        
    }
    


}

