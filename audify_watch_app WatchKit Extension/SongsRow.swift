//
//  SongsRow.swift
//  audify_watch_app WatchKit Extension
//
//  Created by manikandan bangaru on 26/07/21.
//

import WatchKit

class SongsRow: NSObject {

    @IBOutlet weak var songNameLabel: WKInterfaceLabel!
    
    static var identifier : String{
        return "songRow"
    }

}
