//
//  MusicController.swift
//  audify_watch_app WatchKit Extension
//
//  Created by manikandan bangaru on 26/07/21.
//

import WatchKit
import WatchConnectivity
class MusicController: WKInterfaceController, WCSessionDelegate {
    
    

    @IBOutlet weak var songName: WKInterfaceLabel!
    
    @IBAction func GoBack() {
        print("back")
        if WCSession.default.isReachable{
        WCSession.default.sendMessage(["command" : "goBack"], replyHandler: nil, errorHandler: nil)
        }
    }
    
    @IBAction func goForward() {
        print("Forward")
        if WCSession.default.isReachable{
        WCSession.default.sendMessage(["command" : "goForward"], replyHandler: nil, errorHandler: nil)
        }
    }
    
    @IBAction func pause() {
        print("Pause")
        if WCSession.default.isReachable{
            WCSession.default.sendMessage(["command" : "pause"], replyHandler: nil, errorHandler: nil)

        }
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let songNameStr = context as? String{
            self.songName.setText(songNameStr)
        }
        if (WCSession.isSupported()){
            
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activatted")
    }
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("Received msg from app")
        print(applicationContext)
}
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(message)
    }
    
}
